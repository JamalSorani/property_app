// ignore_for_file: deprecated_member_use

// 📦 Package imports:
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

// 🌎 Project imports:
import '../../../../../common/imports/imports.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required this.onTap,
  });

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: GradientBoxBorder(
            width: 3,
            gradient: AppColors.primaryGradient,
          ),
        ),
        padding: REdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: AppColors.primaryGradient,
          ),
          height: 74.h,
          width: 74.h,
          alignment: Alignment.center,
          child: Icon(
            Icons.navigate_next,
            color: Colors.white,
            size: 32.sp,
          ),
        ),
      ),
    );
  }
}
