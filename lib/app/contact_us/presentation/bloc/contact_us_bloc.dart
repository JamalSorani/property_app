// 📦 Package imports:
import 'package:bot_toast/bot_toast.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

// 🌎 Project imports:
import '../../application/facade/contact_us_facade.dart';

part 'contact_us_event.dart';
part 'contact_us_state.dart';

class ContactUsBloc extends Bloc<ContactUsEvent, ContactUsState> {
  final ContactUsFacade _facade;

  ContactUsBloc({required ContactUsFacade facade})
      : _facade = facade,
        super(ContactUsInitial()) {
    on<ContactUsEvent>((event, emit) async {
      if (event is Send) {
        await send(event, emit);
      }
    });
  }

  send(Send event, Emitter<ContactUsState> emit) async {
    if (form.valid) {
      BotToast.showLoading();
      final result = await _facade.contactUs(
        form.control(title).value,
        form.control(message).value,
      );
      result.fold(
        (left) => BotToast.showText(text: left),
        (right) => BotToast.showText(text: 'تم الإرسال بنجاح'),
      );
      BotToast.closeAllLoading();
    } else {
      form.markAllAsTouched();
    }
  }

  static FormGroup form = FormGroup({
    title: FormControl<String>(validators: [Validators.required]),
    message: FormControl<String>(validators: [Validators.required]),
  });

  static const String title = 'title';
  static const String message = 'message';
}
