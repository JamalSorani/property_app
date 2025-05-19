// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';

// 🌎 Project imports:
import 'package:template_app/app/auth/presentation/input_forms/auth_input_keys.dart';
import 'package:template_app/app/auth/presentation/input_forms/login_form.dart';
import '../../../../../common/imports/imports.dart';
import '../../../../../common/injection/injection.dart';
import '../../../../../router/router_config.dart';
import '../../../../root/presentation/ui/screen/root_screen.dart';
import '../../state/bloc/auth_bloc.dart';
import '../widget/auth_button.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const String pagePath = 'login';

  static BeamerBuilder pageBuilder = (context, state, data) {
    return const LoginScreen();
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: getIt<AuthBloc>(),
        child: ReactiveForm(
          formGroup: LoginForm.formGroup,
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state.loginStatus.isSuccess()) {
                context.beamToNamed(RootScreen.pagePath);
              }
            },
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomReactiveField(
                      title: 'البريد الإلكتروني',
                      keyboardType: TextInputType.emailAddress,
                      controller: AuthInputKeys.email,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomReactiveField(
                      title: 'كلمة المرور',
                      isPassword: true,
                      asset: const Icon(CupertinoIcons.eye_slash),
                      suffixPassIcon: const Icon(CupertinoIcons.eye),
                      controller: AuthInputKeys.password,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    AuthButton(
                      isLoading: state.loginStatus.isLoading(),
                      onPressed: () {
                        context.read<AuthBloc>().add(LoginEvent());
                      },
                      title: 'إرسال',
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              context.beamToNamed(SignUp.pagePath);
                            },
                            child: const Text('إنشاء حساب'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
