// 🌎 Project imports:
import '../imports/imports.dart';

// Custom widget to control the size of the ResponsiveCircularProgressIndicator globally
class LoadingProgress extends StatelessWidget {
  final double size;
  final double strokeWidth;
  final Color? color;

  const LoadingProgress({
    super.key,
    this.size = 30,
    this.strokeWidth = 3,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.w,
      height: size.w,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth.r,
        color: color,
      ),
    );
  }
}
