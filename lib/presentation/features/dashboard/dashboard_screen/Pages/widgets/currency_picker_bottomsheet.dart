import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:remittance/core/utils/Colors.dart';
import 'package:remittance/domain/entities/currency_entity.dart';
import 'package:remittance/presentation/features/dashboard/dashboard_screen/providers/theme_provider.dart';

class CurrencyPickerSheet extends ConsumerWidget {
  final List<CurrencyEntity> currencies;
  final Function(CurrencyEntity) onCurrencySelected;

  const CurrencyPickerSheet({
    super.key,
    required this.currencies,
    required this.onCurrencySelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Change Currency',
            style: primaryTextStyle(
                color: ref.watch(themeNotifierProvider).isDarkModeOn
                    ? whitePureColor
                    : TextColorPrimary),
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: 'Search currency or country/region',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.grey[800],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Available Currencies',
            style: primaryTextStyle(
                color: ref.watch(themeNotifierProvider).isDarkModeOn
                    ? whitePureColor
                    : TextColorPrimary),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: currencies.length,
              itemBuilder: (context, index) {
                final currency = currencies[index];
                return ListTile(
                  leading: Text(
                    currency.flag,
                    style: primaryTextStyle(
                        color: ref.watch(themeNotifierProvider).isDarkModeOn
                            ? whitePureColor
                            : TextColorPrimary),
                  ),
                  title: Text(
                    currency.name,
                    style: primaryTextStyle(
                        color: ref.watch(themeNotifierProvider).isDarkModeOn
                            ? whitePureColor
                            : TextColorPrimary),
                  ),
                  trailing: Text(
                    currency.code,
                    style: primaryTextStyle(
                        color: ref.watch(themeNotifierProvider).isDarkModeOn
                            ? whitePureColor
                            : TextColorPrimary),
                  ),
                  onTap: () => onCurrencySelected(currency),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
