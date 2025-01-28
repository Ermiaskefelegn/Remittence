import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:remittance/core/utils/Colors.dart';

class ThemeState {
  final bool isDarkModeOn;

  ThemeState(this.isDarkModeOn);

  // Colors based on the theme
  Color get scaffoldBackground =>
      isDarkModeOn ? appBackgroundColorDark : scaffoldLightColor;

  Color get appBarColor =>
      isDarkModeOn ? cardBackgroundBlackDark : Colors.white;

  Color get backgroundColor => isDarkModeOn ? Colors.black : Colors.white;

  Color get backgroundSecondaryColor =>
      isDarkModeOn ? Colors.black : appSecondaryBackgroundColor;

  Color get appColorPrimaryLightColor =>
      isDarkModeOn ? cardBackgroundBlackDark : appColorPrimaryLight;

  Color get iconColor => isDarkModeOn ? iconColorPrimary : iconColorPrimaryDark;

  Color get iconSecondaryColor =>
      isDarkModeOn ? iconColorSecondary : iconColorSecondaryDark;

  Color get textPrimaryColor => isDarkModeOn ? whiteColor : appTextColorPrimary;

  Color get textSecondaryColor =>
      isDarkModeOn ? Colors.white54 : appTextColorSecondary;

  Color get shadowColor => isDarkModeOn ? appShadowColorDark : appShadowColor;
}
