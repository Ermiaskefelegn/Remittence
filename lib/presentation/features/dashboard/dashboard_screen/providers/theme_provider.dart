import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remittance/core/state/theme_state.dart';

class ThemeNotifier extends StateNotifier<ThemeState> {
  ThemeNotifier() : super(ThemeState(false)); // Default: Light mode

  void toggleDarkMode({bool? value}) {
    state = ThemeState(value ?? !state.isDarkModeOn);
  }
}

// Provide the ThemeNotifier
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, ThemeState>((ref) {
  return ThemeNotifier();
});
