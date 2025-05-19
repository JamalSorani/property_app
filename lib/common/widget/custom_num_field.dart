// 📦 Package imports:

// 🌎 Project imports:
import '../imports/imports.dart';

class CustomNumField extends StatelessWidget {
  const CustomNumField({
    super.key,
    required this.formGroup,
    required this.controller,
    required this.title,
    required this.hintText,
    required this.readOnly,
    required this.onChanged,
  });
  final FormGroup formGroup;
  final String controller;
  final String title;
  final String hintText;
  final bool readOnly;
  final void Function(FormControl p0) onChanged;

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: formGroup,
      child: Padding(
        padding: REdgeInsets.only(bottom: 8.0),
        child: Column(
          children: [
            CustomReactiveField(
              controller: controller,
              title: title,
              hintText: hintText,
              keyboardType: TextInputType.number,
              readOnly: readOnly,
              textDirection: TextDirection.ltr,
              fieldPadding: REdgeInsets.symmetric(horizontal: 16),
              onChanged: (p0) {
                if (p0.value != null) {
                  String value = p0.value.toString();
                  if (value.isNotEmpty) {
                    value.replaceAll(',', '');
                    double? num = double.tryParse(value);
                    if (num != null && num < 0) {
                      value = (num * -1).toString();
                    }
                  }
                  if (!readOnly) {
                    onChanged(p0);
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
