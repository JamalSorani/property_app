// ignore_for_file: empty_catches, must_be_immutable

// 🌎 Project imports:
import 'package:template_app/common/imports/imports.dart';

// Represents a dropdown item with a name and ID
class DropDownData {
  final String name;
  final String id;

  DropDownData({required this.name, required this.id});
}

// Custom dropdown menu widget
class CustomDropDownMenuMain<T> extends StatefulWidget {
  CustomDropDownMenuMain({
    super.key,
    required this.data,
    required this.hintText,
    required this.onSelect,
    required this.selectedItem,
    required this.enableSearch,
    required this.isError,
    required this.validationMessage,
    required this.width,
    this.hintTextStyle,
    this.trailingIcon = const Icon(Icons.arrow_drop_down),
    this.leadingIcon,
    this.maxHeight,
  });

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

  @override
  State<CustomDropDownMenuMain> createState() => _CustomDropDownMenuMainState();
}

class _CustomDropDownMenuMainState extends State<CustomDropDownMenuMain> {
  @override
  Widget build(BuildContext context) {
    // Controller for the dropdown's input field
    TextEditingController textController =
        TextEditingController(text: widget.selectedItem?.name ?? '');

    return DropdownMenu<DropDownData>(
      controller: textController,
      width: widget.width,
      hintText: widget.hintText,
      enableSearch: widget.enableSearch,

      // Styling for the input field
      inputDecorationTheme: InputDecorationTheme(
        constraints: BoxConstraints(
          maxHeight: widget.maxHeight ?? (widget.isError ? 67.h : 47.h),
        ),
        fillColor: Colors.white,
        hintStyle: widget.hintTextStyle ??
            TextStyle(
              color: AppColors.grey,
              fontSize: 12.sp,
            ),
        contentPadding: REdgeInsets.symmetric(vertical: 14, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(0.15)),
          borderRadius: BorderRadius.circular(8.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(0.15)),
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),

      // Handles search functionality
      searchCallback: (entries, query) {
        if (query.isEmpty) {
          widget.onSelect(null, null);
          return null;
        }

        final int index = entries.indexWhere(
          (DropdownMenuEntry entry) => entry.label == query,
        );
        return index != -1 ? index : null;
      },

      // Display validation error message if any
      errorText: widget.isError ? widget.validationMessage : null,

      // Height of the dropdown menu
      menuHeight: context.screenHeight * 0.3,

      // Automatically focus the search field on tap
      requestFocusOnTap: widget.enableSearch,

      expandedInsets: REdgeInsets.symmetric(horizontal: 0),
      enableFilter: widget.enableSearch,

      textStyle: TextStyle(
        fontSize: 15.sp,
        color: const Color(0xFF4B465C),
        fontWeight: FontWeight.w400,
      ),

      // Callback for when an item is selected
      onSelected: (DropDownData? item) {
        if (item != null) {
          widget.onSelect(item.name, item.id);
          widget.isError = false;

          if (context.mounted) {
            FocusScope.of(context).unfocus();
            setState(() {});
          }
        }
      },

      // Trailing icon with clear functionality
      trailingIcon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.selectedItem != null)
            InkWell(
              onTap: () {
                widget.onSelect(null, null);
                if (context.mounted) {
                  setState(() {});
                }
              },
              child: Icon(
                Icons.close,
                size: 20.h,
                color: const Color(0xFF1D1B20),
              ),
            ),
          widget.trailingIcon,
        ],
      ),

      // Leading icon (optional)
      leadingIcon: widget.leadingIcon,

      // Dropdown menu entries
      dropdownMenuEntries: widget.data.map<DropdownMenuEntry<DropDownData>>(
        (DropDownData menu) {
          return DropdownMenuEntry(
            value: menu,
            label: menu.name,
          );
        },
      ).toList(),
    );
  }
}
