// 📦 Package imports:
import 'package:pinput/pinput.dart';

// 🌎 Project imports:
import '../../../../../common/imports/imports.dart';

class PinPutWidget extends StatelessWidget {
  const PinPutWidget({super.key, required this.error, this.onChanged});
  final String? error;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: Pinput(
              autofocus: false,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              keyboardType: TextInputType.name,
              errorTextStyle: TextStyle(fontSize: 8.sp),
              focusedPinTheme: PinTheme(
                width: 46.h,
                height: 46.h,
                textStyle: context.textTheme.titleMedium,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primary),
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              cursor: Container(
                height: 20.h,
                width: 1.h,
                color: AppColors.primary,
              ),
              length: 6,
              defaultPinTheme: PinTheme(
                width: 46.h,
                height: 46.h,
                textStyle: context.textTheme.titleMedium,
                decoration: BoxDecoration(
                  border: Border.all(color: '#DBDADE'.toColor()),
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              onChanged: onChanged,
              errorBuilder: (errorText, pin) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: REdgeInsets.only(top: 2.0),
                      child: Text(
                        errorText ?? AppString.incorrectPin,
                        style: context.textTheme.labelSmall!.copyWith(
                          color: AppColors.red,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          if (error != null)
            Padding(
              padding: REdgeInsets.only(top: 8),
              child: Text(
                error!,
                style: context.textTheme.labelSmall!.copyWith(
                  color: AppColors.red,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
