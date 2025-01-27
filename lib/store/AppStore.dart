import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remittance/core/utils/BankingColors.dart';
import 'package:remittance/core/utils/BankingContants.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:remittance/presentation/features/dashboard/dashboard_screen/providers/theme_provider.dart';

part 'AppStore.g.dart';

final appStoreProvider =
    StateNotifierProvider<AppStoreNotifier, AppStoreState>((ref) {
  return AppStoreNotifier(ref);
});

class AppStoreNotifier extends StateNotifier<AppStoreState> {
  AppStoreNotifier(this.read) : super(AppStoreState());

  final Ref read;

  void toggleDarkMode({bool? value}) {
    final isDarkModeOn = value ?? !state.isDarkModeOn;
    final themeModeNotifier = read(themeModeProvider.notifier);

    if (isDarkModeOn) {
      state = state.copyWith(
        isDarkModeOn: isDarkModeOn,
        scaffoldBackground: appBackgroundColorDark,
        appBarColor: cardBackgroundBlackDark,
        backgroundColor: Colors.white,
        backgroundSecondaryColor: Colors.white,
        appColorPrimaryLightColor: cardBackgroundBlackDark,
        iconColor: iconColorPrimary,
        iconSecondaryColor: iconColorSecondary,
        textPrimaryColor: whiteColor,
        textSecondaryColor: Colors.white54,
      );
      themeModeNotifier.toggleTheme();
    } else {
      state = state.copyWith(
        isDarkModeOn: isDarkModeOn,
        scaffoldBackground: scaffoldLightColor,
        appBarColor: Colors.white,
        backgroundColor: Colors.black,
        backgroundSecondaryColor: appSecondaryBackgroundColor,
        appColorPrimaryLightColor: appColorPrimaryLight,
        iconColor: iconColorPrimaryDark,
        iconSecondaryColor: iconColorSecondaryDark,
        textPrimaryColor: appTextColorPrimary,
        textSecondaryColor: appTextColorSecondary,
      );
      themeModeNotifier.toggleTheme();
    }
  }

  void toggleHover({bool value = false}) {
    state = state.copyWith(isHover: value);
  }
}

class AppStoreState {
  final bool isDarkModeOn;
  final bool isHover;
  final Color? iconColor;
  final Color? backgroundColor;
  final Color? appBarColor;
  final Color? scaffoldBackground;
  final Color? backgroundSecondaryColor;
  final Color? appColorPrimaryLightColor;
  final Color? iconSecondaryColor;
  final Color? textPrimaryColor;
  final Color? textSecondaryColor;

  AppStoreState({
    this.isDarkModeOn = false,
    this.isHover = false,
    this.iconColor,
    this.backgroundColor,
    this.appBarColor,
    this.scaffoldBackground,
    this.backgroundSecondaryColor,
    this.appColorPrimaryLightColor,
    this.iconSecondaryColor,
    this.textPrimaryColor,
    this.textSecondaryColor,
  });

  AppStoreState copyWith({
    bool? isDarkModeOn,
    bool? isHover,
    Color? iconColor,
    Color? backgroundColor,
    Color? appBarColor,
    Color? scaffoldBackground,
    Color? backgroundSecondaryColor,
    Color? appColorPrimaryLightColor,
    Color? iconSecondaryColor,
    Color? textPrimaryColor,
    Color? textSecondaryColor,
  }) {
    return AppStoreState(
      isDarkModeOn: isDarkModeOn ?? this.isDarkModeOn,
      isHover: isHover ?? this.isHover,
      iconColor: iconColor ?? this.iconColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      appBarColor: appBarColor ?? this.appBarColor,
      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
      backgroundSecondaryColor:
          backgroundSecondaryColor ?? this.backgroundSecondaryColor,
      appColorPrimaryLightColor:
          appColorPrimaryLightColor ?? this.appColorPrimaryLightColor,
      iconSecondaryColor: iconSecondaryColor ?? this.iconSecondaryColor,
      textPrimaryColor: textPrimaryColor ?? this.textPrimaryColor,
      textSecondaryColor: textSecondaryColor ?? this.textSecondaryColor,
    );
  }
}
