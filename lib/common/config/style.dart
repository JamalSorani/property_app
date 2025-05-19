// ignore_for_file: deprecated_member_use

// 🌎 Project imports:
import 'package:template_app/common/imports/imports.dart';

///constant
double horizontalAppPadding = 32.w;
double kIconSize = 24.r;

const String fontFamily = "nato";

const designSize = Size(375, 812);

///Style
EdgeInsets buttonRPadding =
    EdgeInsets.symmetric(horizontal: 12.r, vertical: 12.r);

BorderRadius borderRadiusCircular = BorderRadius.circular(12.r);

final ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
  elevation: 2,
  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
  backgroundColor: AppColors.primary,
  foregroundColor: AppColors.white,
  shadowColor: AppColors.primary,
  textStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700),
  shape: RoundedRectangleBorder(borderRadius: borderRadiusCircular),
);

final ChipThemeData chipTheme = ChipThemeData(
  backgroundColor: AppColors.white,
  selectedColor: AppColors.secondary,
  side: const BorderSide(color: AppColors.secondary),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16.r),
  ),
  labelStyle: TextStyle(
    fontSize: 9.sp,
    color: AppColors.black,
  ),
);

final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
  // primary: AppColors.primary,
  textStyle: TextStyle(
      fontSize: 18.sp, color: AppColors.primary, fontWeight: FontWeight.bold),
  padding: buttonRPadding.r,
  side: const BorderSide(color: AppColors.primary),
  shape: RoundedRectangleBorder(borderRadius: borderRadiusCircular),
);

final ButtonStyle textButtonStyle = TextButton.styleFrom(
    // primary: AppColors.primary,
    // padding: buttonRPadding.r,
    textStyle: TextStyle(
      color: AppColors.primary,
      fontWeight: FontWeight.w500,
      fontSize: 14.sp,
    ),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    minimumSize: Size.zero,
    shape: RoundedRectangleBorder(
      borderRadius: borderRadiusCircular,
    ));

final InputDecorationTheme inputDecorationThemeLight = InputDecorationTheme(
    fillColor: Colors.white,
    hintStyle: TextStyle(color: AppColors.grey.withOpacity(0.5)),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.primary),
      borderRadius: borderRadiusCircular,
    ),
    errorStyle: TextStyle(color: AppColors.red, height: 1.sp),
    contentPadding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 16.r),
    border: OutlineInputBorder(borderRadius: borderRadiusCircular),
    disabledBorder: OutlineInputBorder(borderRadius: borderRadiusCircular),
    enabledBorder: OutlineInputBorder(
        borderRadius: borderRadiusCircular,
        borderSide: const BorderSide(color: AppColors.grey)));

final dialogTheme = DialogTheme(
  shape: RoundedRectangleBorder(
    borderRadius: borderRadiusCircular,
  ),
);

final cardTheme = CardTheme(
  elevation: 1,
  shadowColor: AppColors.primary,
  color: AppColors.white,
  surfaceTintColor: AppColors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16.r),
  ),
);

const appBarTheme = AppBarTheme(
    iconTheme: IconThemeData(color: AppColors.white),
    actionsIconTheme: IconThemeData(color: AppColors.white));

final iconTheme = IconThemeData(
  size: kIconSize.r,
  color: AppColors.primary,
);

final checkBoxTheme = CheckboxThemeData(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
  fillColor: MaterialStateProperty.all<Color>(AppColors.primary),
  side: const BorderSide(color: AppColors.grey),
);

const bottomNavigationBarLight = BottomNavigationBarThemeData(
    unselectedItemColor: AppColors.grey,
    selectedItemColor: AppColors.primary,
    backgroundColor: AppColors.white);

InputDecoration dynamicInputDecorationTheme({
  required ThemeData themeData,
  required String labelText,
  required IconData icon,
  String? hintText,
}) =>
    InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: Icon(icon),
        hintStyle: TextStyle(color: AppColors.white.withOpacity(0.3)),
        errorStyle: themeData.textTheme.bodySmall!
            .copyWith(color: themeData.colorScheme.error),
        contentPadding: EdgeInsets.symmetric(horizontal: 10.r),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: borderRadiusCircular),
        errorBorder: InputBorder.none,
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: borderRadiusCircular),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: borderRadiusCircular),
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: borderRadiusCircular),
        prefixIconConstraints: BoxConstraints(minWidth: 40.w));

final InputDecorationTheme inputDecorationThemeDark = InputDecorationTheme(
  fillColor: Colors.grey[700],
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.primary),
    borderRadius: borderRadiusCircular,
  ),
  hintStyle: TextStyle(color: AppColors.white.withOpacity(0.3)),
  errorStyle: TextStyle(color: Colors.red, height: 1.sp),
  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
  border: OutlineInputBorder(borderRadius: borderRadiusCircular),
);
