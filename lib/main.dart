import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remittance/screen/BankingSplash.dart';
import 'package:remittance/store/AppStore.dart';
import 'package:remittance/core/utils/AppTheme.dart';
import 'package:remittance/core/utils/BankingContants.dart';
import 'package:remittance/core/utils/BankingDataGenerator.dart';
import 'package:remittance/core/utils/BankingStrings.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

AppStore appStore = AppStore();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialize(aLocaleLanguageList: languageList());

  appStore.toggleDarkMode(value: getBoolAsync(isDarkModeOnPref));

  defaultRadius = 10;
  defaultToastGravityGlobal = ToastGravity.BOTTOM;

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '$Banking_lbl_app_Name${!isMobile ? ' ${platformName()}' : ''}',
      home: BankingSplash(),
      theme: !appStore.isDarkModeOn
          ? AppThemeData.lightTheme
          : AppThemeData.darkTheme,
      navigatorKey: navigatorKey,
      scrollBehavior: SBehavior(),
      supportedLocales: LanguageDataModel.languageLocales(),
      localeResolutionCallback: (locale, supportedLocales) => locale,
    );
  }
}
