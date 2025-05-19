// 📦 Package imports:
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

// 🌎 Project imports:
import '../../../../../common/helper/bloc_status.dart';
import '../../../application/facade/profile_facade.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileFacade _facade;

  ProfileBloc({required ProfileFacade facade})
      : _facade = facade,
        super(ProfileState()) {
    on<ProfileEvent>((event, emit) async {
      if (event is GetProfile) {
        await getProfile(event, emit);
      } else if (event is SaveProfile) {
        await save(event, emit);
      }
    });
  }

  getProfile(GetProfile event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(status: const BlocStatus.loading()));
    final result = await _facade.getProfile();
    result.fold(
      (left) {
        emit(state.copyWith(status: BlocStatus.fail(error: left)));
      },
      (right) {
        form.control(firstName).value = right.firstName;
        form.control(lastName).value = right.lastName;
        form.control(email).value = right.email;
        form.control(birthdate).value = right.birthDate;
        form.control(phoneNumber).value = right.phonNumber;
        emit(state.copyWith(status: const BlocStatus.success()));
      },
    );
  }

  save(SaveProfile event, Emitter<ProfileState> emit) async {
    if (form.valid) {
      BotToast.showLoading();
      final result = await _facade.getProfile();
      result.fold(
        (left) => BotToast.showText(text: left),
        (right) {
          BotToast.showText(text: 'تم التعديل بنجاح');
        },
      );
      BotToast.closeAllLoading();
    } else {
      form.markAllAsTouched();
    }
  }

  static FormGroup form = FormGroup({
    firstName: FormControl<String>(validators: [Validators.required]),
    lastName: FormControl<String>(validators: [Validators.required]),
    phoneNumber: FormControl<String>(
        validators: [Validators.required, Validators.number]),
    email: FormControl<String>(
        validators: [Validators.required, Validators.email]),
    birthdate: FormControl<DateTime>(validators: []),
  });

  static const String firstName = 'firstName';
  static const String lastName = 'lastName';
  static const String phoneNumber = 'phoneNumber';
  static const String email = 'email';
  static const String birthdate = 'birthdate';
}
