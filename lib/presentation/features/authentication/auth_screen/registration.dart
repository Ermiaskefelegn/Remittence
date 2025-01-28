import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remittance/core/utils/Colors.dart';
import 'package:remittance/core/utils/Widget.dart';
import 'package:remittance/domain/entities/account_entity.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:remittance/presentation/features/authentication/auth_provider.dart';
import 'package:remittance/presentation/features/authentication/auth_screen/sign_in.dart';
import 'package:remittance/core/utils/Strings.dart';

import '../../dashboard/dashboard_screen/providers/theme_provider.dart';

class RemRegistration extends ConsumerStatefulWidget {
  static var tag = "/RemRegistration";

  @override
  _RemRegistrationState createState() => _RemRegistrationState();
}

class _RemRegistrationState extends ConsumerState<RemRegistration> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Access the provider here
    final isDarkModeOn = ref.watch(themeNotifierProvider).isDarkModeOn;
    setStatusBarColor(isDarkModeOn ? black : white);
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    // setStatusBarColor(palColor);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Text(
        lbl_app_Name.toUpperCase(),
        textAlign: TextAlign.center,
        style: primaryTextStyle(size: 16, color: TextColorSecondary),
      ).paddingBottom(16),
      body: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(top: 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(lbl_SignUp,
                  style: boldTextStyle(
                      size: 30,
                      color: ref.watch(themeNotifierProvider).isDarkModeOn
                          ? whitePureColor
                          : TextColorPrimary)),
              16.height,
              // First Name Input
              EditText(
                text: "First Name",
                keyboardType: TextInputType.text,
                isPassword: false,
                mController: firstNameController,
              ),
              8.height,
              // Last Name Input
              EditText(
                text: "Last Name",
                keyboardType: TextInputType.text,
                isPassword: false,
                mController: lastNameController,
              ),
              8.height,
              // Email Input
              EditText(
                text: "Email",
                keyboardType: TextInputType.emailAddress,
                isPassword: false,
                mController: emailController,
              ),
              8.height,
              // Phone Input
              EditText(
                text: "Phone",
                keyboardType: TextInputType.number,
                isPassword: false,
                mController: phoneController,
              ),
              8.height,
              // Password Input
              EditText(
                text: "Password",
                keyboardType: TextInputType.text,
                isPassword: true,
                isSecure: true,
                mController: passwordController,
              ),
              16.height,
              // Sign Up Button
              BankingButton(
                textContent: lbl_SignUp,
                onPressed: () {
                  // Perform Registration
                  final authNotifier = ref.read(authStateProvider.notifier);
                  authNotifier.register(AccountEntity(
                    firstName: firstNameController.text.trim(),
                    lastName: lastNameController.text.trim(),
                    email: emailController.text.trim(),
                    phoneNumber: phoneController.text.trim(),
                    password: passwordController.text.trim(),
                    accountNumber: DateTime.now()
                        .millisecondsSinceEpoch
                        .toString(), // Auto-generate account number
                    balance: 100.0, // Initial balance
                  ));

                  // Navigate to Sign-In Page after successful registration
                  Navigator.pop(
                      context); // Return to the previous screen (Sign In Page)
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content:
                            Text("Registration successful. Please log in.")),
                  );
                },
              ),
              16.height,

              Column(
                children: [
                  Text(
                    already_have_an_account,
                    style:
                        primaryTextStyle(size: 16, color: TextColorSecondary),
                  ),
                  16.height,
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => RemSignIn()),
                      );
                    },
                    child: Text(
                      lbl_SignIn,
                      style: primaryTextStyle(
                          weight: FontWeight.bold,
                          size: 16,
                          color: blueLightColor),
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
