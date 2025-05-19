// 🐦 Flutter imports:
import 'package:flutter/services.dart';

// 📦 Package imports:
import 'package:google_fonts/google_fonts.dart';

// 🌎 Project imports:
import '../imports/imports.dart';
import 'style.dart';

class AppThemes {
  AppThemes._();
  static final ThemeData lightThemeData = ThemeData(
    checkboxTheme: checkBoxTheme,
    indicatorColor: AppColors.primary,
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.primary,
      linearMinHeight: 20.r,
    ),
    dialogBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        padding: REdgeInsets.all(0),
      ),
    ),
    menuTheme: const MenuThemeData(
      style: MenuStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.white),
        shadowColor: WidgetStatePropertyAll(AppColors.primary),
      ),
    ),
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    tabBarTheme: TabBarTheme(
      labelColor: AppColors.primary,
      unselectedLabelColor: AppColors.primary.withOpacity(0.4),
    ),
    datePickerTheme: const DatePickerThemeData(
      backgroundColor: Colors.white,
      headerBackgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      confirmButtonStyle: ButtonStyle(
        textStyle: WidgetStatePropertyAll(
          TextStyle(color: Colors.black),
        ),
        backgroundColor: WidgetStatePropertyAll(Colors.white),
      ),
      cancelButtonStyle: ButtonStyle(
        textStyle: WidgetStatePropertyAll(
          TextStyle(color: Colors.black),
        ),
        backgroundColor: WidgetStatePropertyAll(Colors.white),
      ),
    ),
    textTheme: textTheme,
    brightness: Brightness.light,
    fontFamily: fontFamily,
    primaryColor: AppColors.primary,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primary,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(style: outlineButtonStyle),
    elevatedButtonTheme: ElevatedButtonThemeData(style: elevatedButtonStyle),
    appBarTheme: AppBarTheme(
      elevation: 0,
      foregroundColor: AppColors.black,
      titleTextStyle: textTheme.headlineLarge,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      iconTheme: IconThemeData(color: AppColors.white, size: 22.r),
      color: Colors.transparent,
    ),
    cardTheme: cardTheme,
    dialogTheme: dialogTheme,
    textButtonTheme: TextButtonThemeData(
      style: textButtonStyle,
    ),
    iconTheme: iconTheme,
    chipTheme: chipTheme,
    inputDecorationTheme: inputDecorationThemeLight,
  );

  static final ThemeData darkThemeData = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    primaryColor: AppColors.primary,
    fontFamily: fontFamily,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primary,
    ),

    appBarTheme: const AppBarTheme(
      elevation: 0,
      //     titleTextStyle: TextStyle(color: AppColors.white),
      iconTheme: IconThemeData(color: AppColors.white),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    cardTheme: cardTheme,
    dialogTheme: dialogTheme,
    outlinedButtonTheme: OutlinedButtonThemeData(style: outlineButtonStyle),
    elevatedButtonTheme: ElevatedButtonThemeData(style: elevatedButtonStyle),
    textButtonTheme: TextButtonThemeData(style: textButtonStyle),
    iconTheme: IconThemeData(
      size: kIconSize.r,
      color: Colors.white,
    ),
    textTheme: textTheme,
    scaffoldBackgroundColor: AppColors.black,

    // primarySwatch: AppColors.accent as MaterialColor,
    colorScheme: ThemeData.dark().colorScheme.copyWith(
          primary: AppColors.primary,
          secondary: AppColors.red,
          primaryContainer: Colors.grey[700],
        ),
    inputDecorationTheme: inputDecorationThemeDark,
  );

  static TextTheme textTheme = TextTheme(
    displayLarge: GoogleFonts.cairo(
      fontSize: 26.sp,
      fontWeight: FontWeight.w700,
    ),
    displayMedium: GoogleFonts.cairo(
      fontSize: 22.sp,
      fontWeight: FontWeight.w500,
    ),
    displaySmall: GoogleFonts.cairo(
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
    ),
    headlineLarge: GoogleFonts.cairo(
      fontSize: 22.sp,
      fontWeight: FontWeight.w500,
    ),
    headlineMedium: GoogleFonts.cairo(
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
    ),
    headlineSmall: GoogleFonts.cairo(
      fontSize: 15.sp,
      fontWeight: FontWeight.w700,
    ),
    bodyLarge: GoogleFonts.cairo(
      fontSize: 15.sp,
    ),
    bodyMedium: GoogleFonts.cairo(
      fontSize: 15.sp,
    ),
    bodySmall: GoogleFonts.cairo(
      fontSize: 13.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.grey.withOpacity(0.8),
    ),
    titleLarge: GoogleFonts.cairo(
      fontSize: 22.sp,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: GoogleFonts.cairo(
      fontSize: 18.sp,
    ),
    titleSmall: GoogleFonts.cairo(
      fontSize: 15.sp,
    ),
    labelLarge: GoogleFonts.cairo(
      fontSize: 13.sp,
      fontWeight: FontWeight.w700,
    ),
    labelMedium: GoogleFonts.cairo(
      fontSize: 13.sp,
    ),
    labelSmall: GoogleFonts.cairo(
      fontSize: 11.sp,
    ),
  );
}
