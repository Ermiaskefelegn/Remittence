import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:remittance/core/utils/Colors.dart';
import 'package:remittance/core/utils/Contants.dart';
import 'package:remittance/presentation/features/dashboard/dashboard_screen/providers/theme_provider.dart';

// ignore: must_be_immutable
class CustomButton extends ConsumerStatefulWidget {
  static String tag = '/CustomButton';
  var textContent;
  VoidCallback onPressed;
  var isStroked = false;
  var height = 50.0;
  var radius = 5.0;

  CustomButton(
      {required this.textContent,
      required this.onPressed,
      this.isStroked = false,
      this.height = 45.0,
      this.radius = 5.0});

  @override
  CustomButtonState createState() => CustomButtonState();
}

class CustomButtonState extends ConsumerState<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        height: widget.height,
        padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
        alignment: Alignment.center,
        child: Text(
          widget.textContent.toUpperCase(),
          style:
              boldTextStyle(color: widget.isStroked ? Primary : whitePureColor),
        ).center(),
        decoration: widget.isStroked
            ? boxDecoration(
                ref: ref,
                bgColor: Colors.transparent,
                color: Primary,
              )
            : boxDecoration(
                ref: ref, bgColor: Secondary, radius: widget.radius),
      ),
    );
  }
}

class TopCard extends ConsumerWidget {
  final String name;
  final String acno;
  final String bal;

  TopCard({Key? key, required this.name, required this.acno, required this.bal})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: context.width(),
      height: context.height(),
      color: context.cardColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              children: [
                Icon(Icons.account_balance_wallet, color: Primary, size: 30)
                    .paddingOnly(top: 8, left: 8),
                Text(name,
                        style: primaryTextStyle(
                            size: 18,
                            color: ref.watch(themeNotifierProvider).isDarkModeOn
                                ? whitePureColor
                                : TextColorPrimary))
                    .paddingOnly(left: 8, top: 8)
                    .expand(),
                Icon(Icons.info, color: greyColor, size: 20)
                    .paddingOnly(right: 8)
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Account Number",
                      style: secondaryTextStyle(
                          size: 16,
                          color: ref.watch(themeNotifierProvider).isDarkModeOn
                              ? whitePureColor
                              : TextColorPrimary))
                  .paddingOnly(left: 8, top: 8, bottom: 8),
              Text(acno,
                  style: primaryTextStyle(
                    color: TextColorYellow,
                  )).paddingOnly(right: 8, top: 8, bottom: 8),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Balance",
                      style: secondaryTextStyle(
                          size: 16,
                          color: ref.watch(themeNotifierProvider).isDarkModeOn
                              ? whitePureColor
                              : TextColorPrimary))
                  .paddingOnly(left: 8, top: 8, bottom: 8),
              Text(bal, style: primaryTextStyle(color: TextLightGreenColor))
                  .paddingOnly(right: 8, top: 8, bottom: 8),
            ],
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class EditText extends ConsumerStatefulWidget {
  var isPassword;
  var isSecure;
  var fontSize;
  var textColor;
  var fontFamily;
  var text;
  var maxLine;
  var keyboardType;
  TextEditingController? mController;

  VoidCallback? onPressed;

  EditText({
    var this.fontSize = textSizeNormal,
    var this.textColor = TextColorPrimary,
    var this.fontFamily = fontRegular,
    var this.isPassword = true,
    var this.isSecure = false,
    var this.text = "",
    var this.mController,
    var this.maxLine = 1,
    var this.keyboardType,
  });

  @override
  ConsumerState<EditText> createState() {
    return EditTextState();
  }
}

class EditTextState extends ConsumerState<EditText> {
  @override
  Widget build(BuildContext context) {
    if (!widget.isSecure) {
      return TextField(
        keyboardType: widget.keyboardType,
        controller: widget.mController,
        obscureText: widget.isPassword,
        cursorColor: Primary,
        maxLines: widget.maxLine,
        style: primaryTextStyle(
            color: ref.watch(themeNotifierProvider).isDarkModeOn
                ? whitePureColor
                : TextColorPrimary),
        decoration: InputDecoration(
          hintText: widget.text,
          hintStyle: primaryTextStyle(
              color: ref.watch(themeNotifierProvider).isDarkModeOn
                  ? whitePureColor
                  : TextColorPrimary),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Primary, width: 0.5)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: TextColorSecondary, width: 0.5)),
        ),
      );
    } else {
      return TextField(
        controller: widget.mController,
        obscureText: widget.isPassword,
        cursorColor: Primary,
        style: primaryTextStyle(
            color: ref.watch(themeNotifierProvider).isDarkModeOn
                ? whitePureColor
                : TextColorPrimary),
        decoration: InputDecoration(
            hintText: widget.text,
            hintStyle: primaryTextStyle(
                color: ref.watch(themeNotifierProvider).isDarkModeOn
                    ? whitePureColor
                    : TextColorPrimary),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  widget.isPassword = !widget.isPassword;
                });
              },
              child: Icon(
                widget.isPassword ? Icons.visibility : Icons.visibility_off,
                color: TextColorSecondary,
              ),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: TextColorSecondary, width: 0.5),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Primary, width: 0.5),
            )),
      );
    }
  }
}

Widget headerView(var title, double height, BuildContext context) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.chevron_left,
              size: 25,
              color: Primary,
            ).paddingAll(6).paddingOnly(top: spacing_standard).onTap(() {
              finish(context);
            }).paddingOnly(
                left: spacing_standard,
                right: spacing_standard_new,
                top: spacing_standard_new,
                bottom: spacing_standard),
          ],
        ),
        Text(
          title,
          style: boldTextStyle(size: 30),
        ).paddingOnly(left: spacing_standard_new, right: spacing_standard),
      ],
    ),
  );
}

BoxDecoration boxDecoration(
    {double radius = 2,
    Color color = Colors.transparent,
    Color? bgColor,
    var showShadow = false,
    required WidgetRef ref}) {
  return BoxDecoration(
    color: bgColor ?? ref.watch(themeNotifierProvider).scaffoldBackground,
    boxShadow: showShadow
        ? defaultBoxShadow(shadowColor: shadowColorGlobal)
        : [BoxShadow(color: Colors.transparent)],
    border: Border.all(color: color),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}
