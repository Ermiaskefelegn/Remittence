import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remittance/core/utils/DataGenerator.dart';
import 'package:remittance/core/utils/Contants.dart';
import 'package:remittance/core/utils/Strings.dart';
import 'package:remittance/presentation/features/screen/splash_Screen.dart';
import 'package:remittance/core/utils/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'presentation/features/dashboard/dashboard_screen/providers/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialize(aLocaleLanguageList: languageList());

  final isDarkModeOn = await getBoolAsync(isDarkModeOnPref);

  defaultRadius = 10;
  defaultToastGravityGlobal = ToastGravity.BOTTOM;

  runApp(ProviderScope(overrides: [
    themeNotifierProvider.overrideWith(
        (ref) => ThemeNotifier()..toggleDarkMode(value: isDarkModeOn)),
  ], child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeNotifierProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '$lbl_app_Name${!isMobile ? ' ${platformName()}' : ''}',
      home: BankingSplash(),
      theme: themeState.isDarkModeOn
          ? AppThemeData.darkTheme
          : AppThemeData.lightTheme,
      navigatorKey: navigatorKey,
      scrollBehavior: SBehavior(),
      supportedLocales: LanguageDataModel.languageLocales(),
      localeResolutionCallback: (locale, supportedLocales) => locale,
    );
  }
}
