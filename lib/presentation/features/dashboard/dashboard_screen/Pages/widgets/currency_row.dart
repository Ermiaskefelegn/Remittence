import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:remittance/core/utils/Colors.dart';
import 'package:remittance/presentation/features/dashboard/dashboard_screen/providers/theme_provider.dart';

class CurrencyRow extends ConsumerWidget {
  final String flag;
  final String code;
  final String amount;
  final String subtitle;
  final VoidCallback onTap;

  const CurrencyRow({
    super.key,
    required this.flag,
    required this.code,
    required this.amount,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Text(flag,
                style: primaryTextStyle(
                    size: 24,
                    color: ref.watch(themeNotifierProvider).isDarkModeOn
                        ? whitePureColor
                        : TextColorPrimary)),
            const SizedBox(width: 8),
            Text(code,
                style: primaryTextStyle(
                    size: 18,
                    color: ref.watch(themeNotifierProvider).isDarkModeOn
                        ? whitePureColor
                        : TextColorPrimary)),
            const Icon(Icons.chevron_right),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(amount,
                    style: primaryTextStyle(
                        size: 24,
                        color: ref.watch(themeNotifierProvider).isDarkModeOn
                            ? whitePureColor
                            : TextColorPrimary)),
                Text(subtitle,
                    style: primaryTextStyle(
                        size: 12,
                        color: ref.watch(themeNotifierProvider).isDarkModeOn
                            ? whitePureColor
                            : TextColorPrimary)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
