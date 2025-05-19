// 🌎 Project imports:
import '../../../../../common/imports/imports.dart';

class OnBoardingIndicator extends StatelessWidget {
  const OnBoardingIndicator({super.key, required this.pageIndex});
  final int pageIndex;
  @override
  Widget build(BuildContext context) {
    const color = Colors.grey;
    double size = 10;
    return Row(
      children: [
        for (int i = 0; i < 3; i++)
          Container(
            height: size.h,
            width: i == pageIndex ? 30.h : size.h,
            margin: REdgeInsets.all(2),
            decoration: BoxDecoration(
              color: i == pageIndex ? null : color,
              gradient: i == pageIndex ? AppColors.primaryGradient : null,
              borderRadius: BorderRadius.circular(30.r),
            ),
          ),
      ],
    );
  }
}
