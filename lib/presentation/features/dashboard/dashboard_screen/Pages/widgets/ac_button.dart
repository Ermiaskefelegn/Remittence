import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:remittance/core/utils/Colors.dart';
import 'package:remittance/presentation/features/dashboard/dashboard_screen/providers/theme_provider.dart';

class ACButton extends ConsumerWidget {
  final VoidCallback onPressed;

  const ACButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          border: Border.all(
              color: ref.watch(themeNotifierProvider).isDarkModeOn
                  ? whitePureColor
                  : TextColorPrimary),
          borderRadius: BorderRadius.circular(35),
        ),
        child: Center(
          child: Text(
            'AC',
            style: primaryTextStyle(
                color: ref.watch(themeNotifierProvider).isDarkModeOn
                    ? whitePureColor
                    : TextColorPrimary),
          ),
        ),
      ),
    );
  }
}
