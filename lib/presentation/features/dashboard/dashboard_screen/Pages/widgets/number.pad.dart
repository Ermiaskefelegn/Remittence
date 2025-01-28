import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:remittance/core/utils/Colors.dart';
import 'package:remittance/presentation/features/dashboard/dashboard_screen/Pages/widgets/ac_button.dart';
import 'package:remittance/presentation/features/dashboard/dashboard_screen/providers/theme_provider.dart';

class NumberPad extends StatelessWidget {
  final Function(String) onNumberPressed;

  const NumberPad({super.key, required this.onNumberPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberButton('7', onPressed: onNumberPressed),
              NumberButton('8', onPressed: onNumberPressed),
              NumberButton('9', onPressed: onNumberPressed),
              ACButton(
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberButton('4', onPressed: onNumberPressed),
              NumberButton('5', onPressed: onNumberPressed),
              NumberButton('6', onPressed: onNumberPressed),
              NumberButton('DEL', onPressed: onNumberPressed),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberButton('1', onPressed: onNumberPressed),
              NumberButton('2', onPressed: onNumberPressed),
              NumberButton('3', onPressed: onNumberPressed),
              const SizedBox(width: 70),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberButton('00', onPressed: onNumberPressed),
              NumberButton('0', onPressed: onNumberPressed),
              NumberButton('.', onPressed: onNumberPressed),
              const SizedBox(width: 70),
            ],
          ),
        ],
      ),
    );
  }
}

class NumberButton extends ConsumerWidget {
  final String text;
  final Function(String) onPressed;

  const NumberButton(this.text, {super.key, required this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => onPressed(text),
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          border: Border.all(
              color: ref.watch(themeNotifierProvider).isDarkModeOn
                  ? whitePureColor
                  : TextColorPrimary),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            text,
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
