// ignore_for_file: unused_field

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// 🌎 Project imports:
import 'package:template_app/app/auth/presentation/input_forms/login_form.dart';
import '../../../../../common/helper/bloc_status.dart';
import '../../../application/facade/auth_facade.dart';
import '../../input_forms/signup_form.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthFacade _facade;

  AuthBloc({required AuthFacade facade})
      : _facade = facade,
        super(AuthState()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        await login(event, emit);
      } else if (event is SignUpEvent) {
        await singUp(event, emit);
      }
    });
  }

  login(LoginEvent event, Emitter<AuthState> emit) async {
    if (LoginForm.formGroup.valid) {
      emit(state.copyWith(loginStatus: const BlocStatus.loading()));
      await Future.delayed(const Duration(seconds: 3), () {});
      emit(state.copyWith(loginStatus: const BlocStatus.success()));
    } else {
      LoginForm.formGroup.markAllAsTouched();
    }
  }

  singUp(SignUpEvent event, Emitter<AuthState> emit) async {
    if (SignUpForm.formGroup.valid) {
      emit(state.copyWith(signupStatus: const BlocStatus.loading()));
      await Future.delayed(const Duration(seconds: 3), () {});
      emit(state.copyWith(signupStatus: const BlocStatus.success()));
    } else {
      SignUpForm.formGroup.markAllAsTouched();
    }
  }
}
