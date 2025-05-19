// 🌎 Project imports:
import '../imports/imports.dart';

class FailedWidget extends StatelessWidget {
  const FailedWidget({
    super.key,
    required this.error,
    this.onPressed,
  });

  final String error;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  width: 300.r,
                  height: 300.r,
                  child: const Icon(Icons.warning),
                ),
                Text(
                  error,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 118.w,
                  child: ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondary,
                    ),
                    child: const Text("إعادة المحاولة"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
