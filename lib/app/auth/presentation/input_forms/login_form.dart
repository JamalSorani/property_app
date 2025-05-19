// 📦 Package imports:
import 'package:reactive_forms/reactive_forms.dart';

// 🌎 Project imports:
import '../../../../common/constant/app_string.dart';
import 'auth_input_keys.dart';

class LoginForm {
  static FormGroup formGroup = FormGroup({
    AuthInputKeys.email: FormControl<String>(
      validators: [
        Validators.required,
        Validators.email,
        CustomEmailValidator(),
      ],
    ),
    AuthInputKeys.password: FormControl<String>(
      validators: [Validators.required, Validators.minLength(4)],
    ),
  });

  static String getEmail() {
    return formGroup.control(AuthInputKeys.email).value ?? '';
  }

  static String getPassword() {
    return formGroup.control(AuthInputKeys.password).value ?? '';
  }
}

class CustomEmailValidator extends Validator {
  @override
  Map<String, dynamic>? validate(AbstractControl control) {
    final email = control.value as String?;
    if (email != null && email.endsWith('@gmail.com')) {
      return null; // Valid email
    }
    return {'gmailError': AppString.validEmail};
  }
}
