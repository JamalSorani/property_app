// 🌎 Project imports:
import '../../../../../common/imports/imports.dart';
import '../../state/provider/counter_provider.dart';

class ResendCodeButton extends StatelessWidget {
  const ResendCodeButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppString.codeNotSent,
          style: context.textTheme.bodySmall,
        ),
        horizontalSpace(4),
        Consumer<CountdownProvider>(
          builder: (context, countdownProvider, child) {
            return InkWell(
              onTap: countdownProvider.isTimerRunning
                  ? null
                  : () {
                      // getIt<AuthBloc>().add(ForgetPasswordEvent());
                    },
              child: Text(
                countdownProvider.isTimerRunning
                    ? '${countdownProvider.remainingSeconds}'
                    : AppString.resendCode,
                style: context.textTheme.bodySmall!.copyWith(
                  color: AppColors.grey,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.grey,
                  decorationStyle: TextDecorationStyle.solid,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
