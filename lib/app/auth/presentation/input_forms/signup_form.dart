// 📦 Package imports:
import 'package:reactive_forms/reactive_forms.dart';

// 🌎 Project imports:
import '../../../../common/constant/enum.dart';
import 'auth_input_keys.dart';

class SignUpForm {
  static FormGroup formGroup = FormGroup(
    {
      AuthInputKeys.firstName:
          FormControl<String>(validators: [Validators.required]),
      AuthInputKeys.lastName:
          FormControl<String>(validators: [Validators.required]),
      AuthInputKeys.email:
          FormControl<String>(validators: [Validators.required]),
      AuthInputKeys.gender: FormControl<Gender>()..value = Gender.male,
      AuthInputKeys.image: FormControl<String>(validators: []),
      AuthInputKeys.birthdate: FormControl<DateTime>(validators: []),
      AuthInputKeys.phoneNumber:
          FormControl<String>(validators: [Validators.required]),
      AuthInputKeys.password: FormControl<String>(
          validators: [Validators.required, Validators.minLength(8)]),
      AuthInputKeys.confirmPassword: FormControl<String>(
          validators: [Validators.required, Validators.minLength(8)]),
    },
    validators: [
      Validators.mustMatch(
          AuthInputKeys.password, AuthInputKeys.confirmPassword),
    ],
  );
}
