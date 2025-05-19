// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';

// 🌎 Project imports:
import '../../../../../common/imports/imports.dart';
import '../../input_forms/auth_input_keys.dart';

class PasswordField extends StatelessWidget {
  const PasswordField(
      {super.key, required this.isConfirmPassword, required this.hintText});
  final bool isConfirmPassword;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return CustomReactiveField(
      controller: isConfirmPassword
          ? AuthInputKeys.confirmPassword
          : AuthInputKeys.password,
      keyboardType: TextInputType.text,
      assetPrefix: Icon(
        Icons.lock_outline,
        color: AppColors.grey.withOpacity(0.5),
        size: 24.sp,
      ),
      isPassword: true,
      asset: Icon(
        CupertinoIcons.eye_slash,
        color: AppColors.grey.withOpacity(0.5),
        size: 24.sp,
      ),
      suffixPassIcon: Icon(
        CupertinoIcons.eye,
        color: AppColors.grey.withOpacity(0.5),
        size: 24.sp,
      ),
      hintText: hintText,
    );
  }
}
