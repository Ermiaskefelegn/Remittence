import 'package:remittance/main.dart';
import 'package:remittance/screen/BankingResend.dart';
import 'package:remittance/core/utils/BankingColors.dart';
import 'package:remittance/core/utils/BankingContants.dart';
import 'package:remittance/core/utils/BankingStrings.dart';
import 'package:remittance/core/utils/BankingWidget.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class BankingForgotPassword extends StatefulWidget {
  @override
  _BankingForgotPasswordState createState() => _BankingForgotPasswordState();
}

class _BankingForgotPasswordState extends State<BankingForgotPassword> {
  @override
  void initState() {
    setStatusBarColor(appStore.isDarkModeOn ? black : white);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Text(
        Banking_lbl_app_Name.toUpperCase(),
        textAlign: TextAlign.center,
        style: primaryTextStyle(
            color: Banking_TextColorSecondary,
            size: 16,
            fontFamily: fontRegular),
      ).paddingOnly(bottom: 16),
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              30.height,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.chevron_left,
                    size: 30,
                    color: appStore.isDarkModeOn ? white : Banking_blackColor,
                  ).onTap(
                    () {
                      finish(context);
                    },
                  ),
                  30.height,
                  Text("Forgot\nPassword", style: boldTextStyle(size: 30)),
                ],
              ),
              34.height,
              Text(Banking_lbl_Walk1SubTitle,
                  style: primaryTextStyle(color: Banking_TextColorSecondary)),
              16.height,
              EditText(
                  text: "Phone",
                  keyboardType: TextInputType.number,
                  isPassword: false),
              16.height,
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  Banking_lbl_Resend,
                  style: secondaryTextStyle(size: 16, fontFamily: fontMedium),
                ).onTap(
                  () {
                    BankingResend().launch(context);
                  },
                ),
              ),
              16.height,
              BankingButton(
                textContent: Banking_lbl_Next,
                onPressed: () {
                  BankingResend().launch(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
