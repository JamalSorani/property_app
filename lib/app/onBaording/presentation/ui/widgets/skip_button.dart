// 🌎 Project imports:
import '../../../../../common/imports/imports.dart';
import '../../../../auth/presentation/ui/screen/login_screen.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            context.beamToNamed(LoginScreen.pagePath);
          },
          child: Text(
            AppString.skip,
            style: context.textTheme.headlineMedium!.copyWith(
              color: AppColors.grey.withOpacity(0.5),
            ),
          ),
        ),
      ],
    );
  }
}
