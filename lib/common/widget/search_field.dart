// 🌎 Project imports:
import '../imports/imports.dart';
import '../utils/extensions/text_direction.dart';

class SearchFeild extends StatefulWidget {
  const SearchFeild({
    super.key,
    required this.hintText,
    required this.keyboardType,
    required this.readOnly,
    required this.onFieldSubmitted,
    required this.onTap,
  });
  final String hintText;
  final TextInputType? keyboardType;
  final bool readOnly;
  final void Function(String? query) onFieldSubmitted;
  final void Function() onTap;

  @override
  State<SearchFeild> createState() => _SearchFeildState();
}

class _SearchFeildState extends State<SearchFeild> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.grey),
      borderRadius: BorderRadius.circular(16.r),
    );
    Widget? clearButton = searchController.text.isNotEmpty && !widget.readOnly
        ? GestureDetector(
            onTap: () {
              setState(() {
                searchController.clear();
              });
              widget.onFieldSubmitted(null);
            },
            child: const Icon(
              Icons.clear,
              color: Colors.black,
            ),
          )
        : const SizedBox();
    return Expanded(
      child: TextFormField(
        controller: searchController,
        onTap: widget.onTap,
        readOnly: widget.readOnly,
        textInputAction: TextInputAction.search,
        textDirection: searchController.text.textDirection,
        textAlign: searchController.text.textDirection == TextDirection.ltr
            ? TextAlign.left
            : TextAlign.right,
        onFieldSubmitted: widget.onFieldSubmitted,
        onChanged: (value) {
          setState(() {});
        },
        keyboardType: widget.keyboardType ?? TextInputType.text,
        decoration: InputDecoration(
          hintText: widget.hintText,
          contentPadding: REdgeInsets.symmetric(vertical: 14, horizontal: 14),
          hintStyle: TextStyle(
            fontSize: 16.sp,
          ),
          prefixIcon: Icon(
            Icons.search,
            size: 23.h,
            color: Colors.black,
          ),
          prefixIconConstraints: BoxConstraints(maxWidth: 35.h, minWidth: 35.h),
          labelStyle: context.textTheme.headlineSmall,
          suffixIcon: clearButton,
          suffixIconConstraints: BoxConstraints(maxWidth: 35.h, minWidth: 35.h),
          border: border,
          enabledBorder: border,
          disabledBorder: border,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
      ),
    );
  }
}
