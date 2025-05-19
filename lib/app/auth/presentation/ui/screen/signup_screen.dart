// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';

// 📦 Package imports:
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';

// 🌎 Project imports:
import 'package:template_app/app/auth/presentation/input_forms/auth_input_keys.dart';
import 'package:template_app/app/auth/presentation/input_forms/signup_form.dart';
import '../../../../../common/constant/enum.dart';
import '../../../../../common/imports/imports.dart';
import '../../../../../common/injection/injection.dart';
import '../../../../../router/router_config.dart';
import '../../../../root/presentation/ui/screen/root_screen.dart';
import '../../state/bloc/auth_bloc.dart';
import '../widget/auth_button.dart';
import 'login_screen.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  static String pagePath = 'signup';

  static BeamerBuilder pageBuilder = (context, state, data) {
    return const SignUp();
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: getIt<AuthBloc>(),
        child: ReactiveForm(
          formGroup: SignUpForm.formGroup,
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state.signupStatus.isSuccess()) {
                context.beamToNamed(RootScreen.pagePath);
              }
            },
            builder: (context, state) {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomReactiveField(
                          title: 'الاسم الأول',
                          controller: AuthInputKeys.firstName,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomReactiveField(
                          title: 'الاسم الثاني',
                          controller: AuthInputKeys.lastName,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomReactiveField(
                          title: 'البريد الإلكتروني',
                          keyboardType: TextInputType.emailAddress,
                          controller: AuthInputKeys.email,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomReactiveField(
                          title: 'الرقم',
                          keyboardType: TextInputType.phone,
                          controller: AuthInputKeys.phoneNumber,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            const Text('الجنس'),
                            Row(
                              children: [
                                ReactiveRadio(
                                  value: Gender.male,
                                  formControlName: AuthInputKeys.gender,
                                ),
                                const Text('ذكر'),
                              ],
                            ),
                            Row(
                              children: [
                                ReactiveRadio(
                                  value: Gender.female,
                                  formControlName: AuthInputKeys.gender,
                                ),
                                const Text('أنثى'),
                              ],
                            ),
                            Row(
                              children: [
                                ReactiveRadio(
                                  value: Gender.other,
                                  formControlName: AuthInputKeys.gender,
                                ),
                                const Text('آخر'),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.r),
                              child: Text(
                                'تاريخ الميلاد',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        ReactiveDateTimePicker(
                          formControlName: AuthInputKeys.birthdate,
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
                          height: 10.h,
                        ),
                        CustomReactiveField(
                          title: 'تأكيد كلمة السر',
                          isPassword: true,
                          asset: const Icon(CupertinoIcons.eye_slash),
                          suffixPassIcon: const Icon(CupertinoIcons.eye),
                          controller: AuthInputKeys.confirmPassword,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        AuthButton(
                          isLoading: state.signupStatus.isLoading(),
                          onPressed: () {
                            context.read<AuthBloc>().add(SignUpEvent());
                          },
                          title: 'إرسال',
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  context.beamToNamed(LoginScreen.pagePath);
                                },
                                child: const Text('تسجيل الدخول'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
