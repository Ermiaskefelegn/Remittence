import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remittance/core/utils/Colors.dart';
import 'package:remittance/core/utils/Contants.dart';
import 'package:remittance/core/utils/Strings.dart';
import 'package:remittance/core/utils/Widget.dart';
import 'package:remittance/presentation/features/authentication/auth_screen/sign_in.dart';
import 'package:remittance/core/utils/Images.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:remittance/presentation/features/dashboard/dashboard_screen/providers/theme_provider.dart';

class OnBoarding extends ConsumerStatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends ConsumerState<OnBoarding> {
  int currentIndexPage = 0;
  int? pageLength;

  var titles = [lbl_Walk1Title, lbl_Walk2Title, lbl_Walk3Title];

  var subTitles = [lbl_Walk1SubTitle, lbl_Walk1SubTitle, lbl_Walk1SubTitle];

  @override
  void initState() {
    super.initState();
    currentIndexPage = 0;
    pageLength = 3;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Access the provider here
    final isDarkModeOn = ref.watch(themeNotifierProvider).isDarkModeOn;
    setStatusBarColor(isDarkModeOn ? black : white);
  }

  @override
  void dispose() {
    setStatusBarColor(palColor);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: PageView(
              children: [
                WalkThrough(textContent: ic_walk1),
                WalkThrough(textContent: ic_walk2),
                WalkThrough(textContent: ic_walk3),
              ],
              onPageChanged: (value) {
                setState(() {
                  currentIndexPage = value;
                });
              },
            ),
          ),
          Positioned(
            width: context.width(),
            bottom: context.height() * 0.38,
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(titles[currentIndexPage],
                      style: boldTextStyle(size: 20)),
                  10.height,
                  // Adding Button
                ],
              ),
            ),
          ),
          Positioned(
            width: context.width(),
            height: 50,
            top: context.height() * 0.58,
            child: Align(
              alignment: Alignment.center,
              child: DotsIndicator(
                dotsCount: 3,
                position: currentIndexPage,
                decorator:
                    DotsDecorator(color: view_color, activeColor: Primary),
              ),
            ),
          ),
          Positioned(
            width: context.width(),
            top: context.height() * 0.6,
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Text(
                      subTitles[currentIndexPage],
                      style: primaryTextStyle(
                          fontFamily: fontRegular,
                          size: 14,
                          color: TextColorSecondary),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  50.height,
                  // Adding Button
                  CustomButton(
                    textContent: lbl_Get_Started,
                    onPressed: () {
                      // finish(context);
                      RemSignIn().launch(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WalkThrough extends StatelessWidget {
  final String textContent;

  WalkThrough({Key? key, required this.textContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SafeArea(
          child: Container(
            width: context.width(),
            height: 350,
            alignment: Alignment.center,
            child: Image.asset(textContent, width: 300, height: 300),
          ),
        ),
      ],
    );
  }
}
