// ignore_for_file: must_be_immutable

// 📦 Package imports:

// 🌎 Project imports:
import 'package:template_app/common/imports/imports.dart';

class CustomReactiveField extends StatelessWidget {
  CustomReactiveField({
    super.key,
    this.hintText,
    this.textInputAction = TextInputAction.next,
    required this.controller,
    this.initialValue,
    this.isExpend = false,
    this.onSuffixTap,
    this.maxLines = 1,
    this.onPrefixTap,
    this.height,
    this.width,
    this.onChanged,
    this.assetPrefix,
    this.textDirection = TextDirection.ltr,
    this.asset,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.borderAlwaysEnable = false,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.isPassword = false,
    this.title,
    this.onTap,
    this.fill = true,
    this.titleColor,
    this.suffixPassIcon,
    this.fieldPadding,
    this.prefixPadding,
    this.suffixPadding,
  });
  final String? hintText;
  final Object? asset;
  final Object? assetPrefix;
  final String? initialValue;
  final TextInputAction textInputAction;
  final TextDirection textDirection;
  final TextInputType keyboardType;
  final String controller;
  final int maxLines;
  final double? height;
  final bool isExpend;
  final VoidCallback? onSuffixTap;
  final BorderRadius borderRadius;
  final VoidCallback? onPrefixTap;
  final Function(FormControl<dynamic>)? onChanged;
  final double? width;
  final bool borderAlwaysEnable;
  final bool readOnly;
  final ReactiveFormFieldCallback? onTap;
  final String? title;
  final Color? titleColor;
  final bool fill;
  final Object? suffixPassIcon;
  bool isPassword;
  final EdgeInsets? fieldPadding;
  final EdgeInsets? prefixPadding;
  final EdgeInsets? suffixPadding;

  @override
  Widget build(BuildContext context) {
    bool hidden = false;
    return StatefulBuilder(builder: (context, setState) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title != null
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.r),
                  child: Text(
                    title!,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(color: titleColor),
                  ),
                )
              : const SizedBox(),
          SizedBox(
            height: title != null ? 8.h : 0,
          ),
          ReactiveTextField(
            formControlName: controller,
            maxLines: isExpend ? null : maxLines,
            minLines: isExpend ? null : maxLines,
            expands: isExpend,
            readOnly: readOnly,
            onTap: onTap,
            keyboardType: keyboardType,
            // textDirection: textDirection,
            textInputAction: textInputAction,
            validationMessages: {
              ValidationMessage.required: (e) => AppString.thisFieldRequired,
              ValidationMessage.email: (e) => AppString.validEmail,
              ValidationMessage.minLength: (e) => AppString.passwordMinLength,
              ValidationMessage.mustMatch: (e) => AppString.mustMatch,
            },
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hintText,
              hintTextDirection: textDirection,
              filled: fill,
              contentPadding: fieldPadding ??
                  REdgeInsets.symmetric(vertical: 8, horizontal: 16),
              enabledBorder: borderAlwaysEnable
                  ? OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColors.primary),
                      borderRadius: borderRadius)
                  : null,
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.primary),
                  borderRadius: borderRadius),
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: AppColors.grey),
              prefixIcon: assetPrefix != null
                  ? GestureDetector(
                      onTap: onPrefixTap,
                      child: Padding(
                        padding: prefixPadding ??
                            EdgeInsets.symmetric(
                                horizontal: 26.r, vertical: 6.r),
                        child: assetPrefix is String
                            ? SvgPicture.asset(assetPrefix!.toString())
                            : assetPrefix! as Widget,
                      ),
                    )
                  : null,
              suffixIcon: asset != null
                  ? GestureDetector(
                      onTap: suffixPassIcon != null
                          ? () {
                              setState(() {
                                hidden = !hidden;
                                isPassword = !isPassword;
                              });
                            }
                          : onSuffixTap,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnimatedCrossFade(
                              alignment: Alignment.centerRight,
                              firstChild: asset is String
                                  ? SvgPicture.asset(asset!.toString())
                                  : asset! as Widget,
                              secondChild: suffixPassIcon is String
                                  ? SvgPicture.asset(suffixPassIcon!.toString())
                                  : suffixPassIcon! as Widget,
                              crossFadeState: hidden
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              duration: const Duration(milliseconds: 400),
                            ),
                          ],
                        ),
                      ),
                    )
                  : null,
            ),
            obscureText: isPassword,
          ),
        ],
      );
    });
  }
}
