import 'package:arti_vaghani/config/config_packages.dart';

class AppTheme {
  static final light = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(color: AppColors.primaryColor),
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.white,
    iconTheme: const IconThemeData(color: AppColors.primaryColor),
    colorScheme: const ColorScheme.dark(
        onPrimary: AppColors.primaryColor,
        background: AppColors.primaryColor,
        tertiary: AppColors.black,
        onSecondary: AppColors.primaryColor,
        onBackground: AppColors.white),
    cardColor: AppColors.bgBack,
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
    hintColor: AppColors.greyColor,
    textTheme: TextTheme(
      headlineLarge: getTextStyle(AppColors.black, FontDimen.dimen25,
          fontWeight: FontWeight.w700),
      headlineMedium: getTextStyle(AppColors.primaryColor, FontDimen.dimen16,
          fontWeight: FontWeight.w500),
      displayLarge: getTextStyle(AppColors.greyColor, FontDimen.dimen16,
          fontWeight: FontWeight.w400),
      displayMedium: getTextStyle(AppColors.greyColor, FontDimen.dimen14,
          fontWeight: FontWeight.w400),
      displaySmall: getTextStyle(AppColors.greyColor, FontDimen.dimen12,
          fontWeight: FontWeight.w400),
      bodyLarge: getTextStyle(AppColors.black, FontDimen.dimen14,
          fontWeight: FontWeight.w400),
      bodyMedium: getTextStyle(AppColors.black, FontDimen.dimen12,
          fontWeight: FontWeight.w400),
      bodySmall: getTextStyle(AppColors.white, FontDimen.dimen18,
          fontWeight: FontWeight.w500),
      labelLarge: getTextStyle(AppColors.black, FontDimen.dimen20,
          fontWeight: FontWeight.w500),
      labelSmall: getTextStyle(AppColors.black, FontDimen.dimen16,
          fontWeight: FontWeight.w500),
    ),
  );
}

TextStyle getTextStyle(Color color, double size, {FontWeight? fontWeight}) =>
    TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
        letterSpacing: 0.2,
        height: 1.4);
