// 📦 Package imports:
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

// 🌎 Project imports:
import 'package:template_app/common/imports/imports.dart';

class AuthButton extends StatelessWidget {
  final bool isLoading;
  final String title;
  final void Function() onPressed;

  const AuthButton({
    super.key,
    required this.isLoading,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? () {} : onPressed,
      child: Container(
        width: context.screenWidth,
        height: 40.h,
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
          borderRadius: BorderRadius.circular(8.r),
        ),
        alignment: Alignment.center,
        child: isLoading
            ? Center(
                child: LoadingProgress(
                  color: AppColors.white,
                  size: 30.h,
                ),
              )
            : Text(
                title,
                style: context.textTheme.bodySmall!.copyWith(
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}

class OutLinedButton extends StatelessWidget {
  final bool isLoading;
  final Widget? child;
  final String title;
  final void Function() onPressed;

  const OutLinedButton({
    super.key,
    required this.isLoading,
    required this.title,
    this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? () {} : onPressed,
      child: Container(
        width: context.screenWidth,
        height: 40.h,
        decoration: BoxDecoration(
          border: GradientBoxBorder(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                "#11405C".toColor(),
                "#11405C".toColor().withOpacity(0.6),
              ],
            ),
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        alignment: Alignment.center,
        child: isLoading
            ? Center(
                child: LoadingProgress(
                  size: 30.h,
                ),
              )
            : child ??
                Text(
                  title,
                  style: context.textTheme.bodySmall!.copyWith(
                    color: Colors.white,
                  ),
                ),
      ),
    );
  }
}
