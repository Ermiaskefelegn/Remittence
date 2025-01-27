import 'package:remittance/main.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:remittance/presentation/features/authentication/auth_provider.dart';
import 'package:remittance/presentation/features/authentication/auth_screen/registration.dart';
import 'package:remittance/presentation/features/dashboard/dashboard_screen/Dashboard.dart';
import 'package:remittance/screen/toDelete/BankingForgotPassword.dart';
import 'package:remittance/core/utils/BankingColors.dart';
import 'package:remittance/core/utils/BankingStrings.dart';
import 'package:remittance/core/utils/BankingWidget.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class RemSignIn extends ConsumerStatefulWidget {
  static var tag = "/RemSignIn";

  @override
  _RemSignInState createState() => _RemSignInState();
}

class _RemSignInState extends ConsumerState<RemSignIn> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setStatusBarColor(appStore.isDarkModeOn ? black : white);
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    // setStatusBarColor(Banking_palColor);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Text(
        Banking_lbl_app_Name.toUpperCase(),
        textAlign: TextAlign.center,
        style: primaryTextStyle(size: 16, color: Banking_TextColorSecondary),
      ).paddingBottom(16),
      body: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(top: 100),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(Banking_lbl_SignIn, style: boldTextStyle(size: 30)),
              16.height,
              // Phone Input
              EditText(
                text: "Phone",
                keyboardType: TextInputType.number,
                isPassword: false,
                mController: phoneController, // Add controller
              ),
              8.height,
              // Password Input
              EditText(
                text: "Password",
                keyboardType: TextInputType.text,
                isPassword: true,
                isSecure: true,
                mController: passwordController, // Add controller
              ),
              16.height,
              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  Banking_lbl_Forgot,
                  style: secondaryTextStyle(size: 16),
                ).onTap(() {
                  BankingForgotPassword().launch(context);
                }),
              ),
              16.height,
              // Sign In Button
              BankingButton(
                textContent: Banking_lbl_SignIn,
                onPressed: () {
                  // Perform Login
                  final authNotifier = ref.read(authStateProvider.notifier);
                  authNotifier.login(
                      phoneController.text, passwordController.text);

                  final account = ref.read(authStateProvider);

                  if (account != null) {
                    // Login successful, navigate to dashboard
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Dashboard()),
                    );
                  } else {
                    // Login failed, show error
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Invalid phone or password")),
                    );
                  }
                },
              ),
              16.height,

              Column(
                children: [
                  Text(
                    dont_have_an_account,
                    style: primaryTextStyle(
                        size: 16, color: Banking_TextColorSecondary),
                  ),
                  16.height,
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RemRegistration()),
                      );
                    },
                    child: Text(
                      Banking_lbl_SignUp,
                      style: primaryTextStyle(
                          weight: FontWeight.bold,
                          size: 16,
                          color: Banking_blueLightColor),
                    ),
                  ),
                ],
              ).center(),
            ],
          ),
        ),
      ),
    );
  }
}
