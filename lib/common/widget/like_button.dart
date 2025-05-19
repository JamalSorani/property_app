// 📦 Package imports:
import 'package:like_button/like_button.dart';

// 🌎 Project imports:
import '../imports/imports.dart';

class LikeButtonWidget extends StatelessWidget {
  const LikeButtonWidget({super.key, this.onTap, this.size = 32, this.isLiked});

  final LikeButtonTapCallback? onTap;
  final double size;
  final bool? isLiked;

  @override
  Widget build(BuildContext context) {
    return LikeButton(
      size: size.r,
      onTap: onTap,
      isLiked: isLiked,
      circleColor: const CircleColor(
        start: Colors.redAccent,
        end: Colors.red,
      ),
      bubblesColor: const BubblesColor(
        dotPrimaryColor: Colors.red,
        dotSecondaryColor: Colors.redAccent,
      ),
      likeBuilder: (bool isLiked) {
        return Container(
          width: size.r,
          height: size.r,
          // padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                  color: isLiked ? Colors.redAccent : Colors.transparent)),
          child: Container(
            width: size.r,
            height: size.r,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.white.withOpacity(0.7)),
            alignment: Alignment.center,
            child: Center(
              child: Icon(
                isLiked ? Icons.favorite : Icons.favorite_border,
                color: isLiked ? Colors.redAccent : Colors.grey,
                size: (size / 1.6).r,
              ),
            ),
          ),
        );
      },
    );
  }
}
