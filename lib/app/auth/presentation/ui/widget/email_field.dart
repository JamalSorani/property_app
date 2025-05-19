// 🌎 Project imports:
import '../../../../../common/imports/imports.dart';
import '../../input_forms/auth_input_keys.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomReactiveField(
      controller: AuthInputKeys.email,
      keyboardType: TextInputType.emailAddress,
      assetPrefix: Icon(
        Icons.email_outlined,
        color: AppColors.grey.withOpacity(0.5),
        size: 24.sp,
      ),
      hintText: AppString.email,
    );
  }
}
