// 📦 Package imports:

// 🌎 Project imports:
import '../imports/imports.dart';
import 'custom_drop_down_menu.dart';

// ignore: must_be_immutable
class CustomPickerField extends StatelessWidget {
  // List of dropdown items
  final List<DropDownData> data;

  // Hint text to display when no item is selected
  final String hintText;

  // Callback for when an item is selected
  final void Function(String? name, String? id) onSelect;

  // Currently selected dropdown item
  final DropDownData? selectedItem;

  // Whether search is enabled within the dropdown
  final bool enableSearch;

  // Whether there is a validation error
  bool isError;

  // Validation error message
  final String validationMessage;

  // Width of the dropdown menu
  final double width;

  // Optional text style for the hint text
  final TextStyle? hintTextStyle;

  // Optional maximum height of the dropdown
  final double? maxHeight;

  // Icon to display at the end of the dropdown
  final Widget trailingIcon;

  // Optional icon to display at the start of the dropdown
  final Widget? leadingIcon;

  final String title;

  final bool isLoading;

  final bool readOnly;

  final FormGroup? formGroup; // readOnly Case

  final String? controller; // readOnly Case

  CustomPickerField({
    super.key,
    required this.data,
    required this.hintText,
    required this.onSelect,
    this.selectedItem,
    required this.enableSearch,
    required this.validationMessage,
    required this.width,
    this.hintTextStyle,
    this.maxHeight,
    this.trailingIcon = const Icon(Icons.arrow_drop_down),
    this.leadingIcon,
    required this.isError,
    required this.title,
    required this.isLoading,
    required this.readOnly,
    this.formGroup,
    this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: REdgeInsets.only(right: 3),
            child: Text(
              title,
              style: context.textTheme.titleMedium?.copyWith(
                color: Colors.black,
                fontSize: 13.sp,
              ),
            ),
          ),
          SizedBox(height: 2.h),
          isLoading
              ? const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoadingProgress(),
                  ],
                )
              : readOnly
                  ? ReactiveForm(
                      formGroup: formGroup!,
                      child: CustomReactiveField(
                        controller: controller!,
                        readOnly: true,
                      ),
                    )
                  : CustomDropDownMenuMain(
                      data: data,
                      hintText: hintText,
                      onSelect: onSelect,
                      width: width,
                      isError: isError,
                      selectedItem: selectedItem,
                      enableSearch: enableSearch,
                      validationMessage: validationMessage,
                      hintTextStyle: hintTextStyle,
                      trailingIcon: trailingIcon,
                      leadingIcon: leadingIcon,
                      maxHeight: maxHeight,
                    ),
        ],
      ),
    );
  }
}
