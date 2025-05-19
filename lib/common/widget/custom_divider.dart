// 🌎 Project imports:
import '../imports/imports.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: context.screenWidth,
      margin: REdgeInsets.symmetric(
        vertical: 10,
        horizontal: 2,
      ),
      color: const Color(0xFFDBDADE),
    );
  }
}
