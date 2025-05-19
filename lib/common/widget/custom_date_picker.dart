// 📦 Package imports:
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';

// 🌎 Project imports:
import '../imports/imports.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({
    super.key,
    required this.formControlName,
    this.title,
    this.textPadding,
    this.padding,
    this.prefixPadding,
  });
  final String formControlName;
  final String? title;
  final EdgeInsets? textPadding;
  final EdgeInsets? padding;
  final EdgeInsets? prefixPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title != null
              ? Padding(
                  padding: textPadding ?? EdgeInsets.symmetric(horizontal: 4.r),
                  child: Text(
                    title!,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                )
              : const SizedBox(),
          SizedBox(
            height: title != null ? 8.h : 0,
          ),
          ReactiveDateTimePicker(
            formControlName: formControlName,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: prefixPadding ??
                    EdgeInsets.symmetric(horizontal: 26.r, vertical: 6.r),
                child: const Icon(Icons.date_range_outlined),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
