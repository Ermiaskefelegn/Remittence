import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:remittance/core/utils/Colors.dart';
import 'package:remittance/presentation/features/dashboard/dashboard_screen/Pages/widgets/currency_picker_bottomsheet.dart';
import 'package:remittance/presentation/features/dashboard/dashboard_screen/Pages/widgets/currency_row.dart';
import 'package:remittance/presentation/features/dashboard/dashboard_screen/Pages/widgets/number.pad.dart';
import 'package:remittance/presentation/features/dashboard/dashboard_screen/providers/theme_provider.dart';
import '../providers/currency_provider.dart';

class CurrencyConverterScreen extends ConsumerStatefulWidget {
  const CurrencyConverterScreen({super.key});

  @override
  _CurrencyConverterScreenState createState() =>
      _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState
    extends ConsumerState<CurrencyConverterScreen> {
  String amount = '100'; // Default input amount
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Access the provider here
    final isDarkModeOn = ref.watch(themeNotifierProvider).isDarkModeOn;
    setStatusBarColor(isDarkModeOn ? black : white);
  }

  void _showCurrencyPicker() {
    final currencies = ref.watch(fetchCurrenciesProvider);
    currencies.when(
      data: (data) {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.grey[900],
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          builder: (context) => CurrencyPickerSheet(
            currencies: data,
            onCurrencySelected: (currency) {
              ref.read(baseCurrencyProvider.notifier).state = currency.code;
              Navigator.pop(context);
            },
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(
          child: Text("Error: $e",
              style: primaryTextStyle(
                  color: ref.watch(themeNotifierProvider).isDarkModeOn
                      ? whitePureColor
                      : TextColorPrimary))),
    );
  }

  @override
  Widget build(BuildContext context) {
    final baseCurrency = ref.watch(baseCurrencyProvider);
    final exchangeRates = ref.watch(exchangeRatesProvider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Online Currency Converter ($baseCurrency)',
          style: primaryTextStyle(
              color: ref.watch(themeNotifierProvider).isDarkModeOn
                  ? whitePureColor
                  : TextColorPrimary),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: exchangeRates.when(
              data: (rates) => ListView(
                padding: const EdgeInsets.all(16),
                children: rates.entries.map((entry) {
                  final targetCurrency = entry.key;
                  final conversionRate = entry.value;
                  final convertedAmount =
                      (double.tryParse(amount) ?? 0) * conversionRate;

                  return CurrencyRow(
                    flag: _getCurrencyFlag(targetCurrency),
                    code: targetCurrency,
                    amount: convertedAmount.toStringAsFixed(2),
                    subtitle: _getCurrencyName(targetCurrency),
                    onTap: _showCurrencyPicker,
                  );
                }).toList(),
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, _) => Center(
                  child: Text("Error: $error",
                      style: primaryTextStyle(
                          color: ref.watch(themeNotifierProvider).isDarkModeOn
                              ? whitePureColor
                              : TextColorPrimary))),
            ),
          ),
          NumberPad(
            onNumberPressed: (value) {
              setState(() {
                if (value == 'AC') {
                  amount = '0';
                } else if (value == 'DEL') {
                  amount = amount.isNotEmpty
                      ? amount.substring(0, amount.length - 1)
                      : '0';
                } else {
                  amount = amount == '0' ? value : amount + value;
                }
              });
            },
          ),
        ],
      ),
    );
  }

  // Mock implementation to get currency names and flags
  String _getCurrencyName(String code) {
    switch (code) {
      case 'EUR':
        return 'Euro';
      case 'USD':
        return 'United States Dollar';
      case 'JPY':
        return 'Japanese Yen';
      case 'BGN':
        return 'Bulgarian Lev';
      case 'CZK':
        return 'Czech Republic Koruna';
      case 'DKK':
        return 'Danish Krone';
      case 'GBP':
        return 'British Pound Sterling';
      case 'HUF':
        return 'Hungarian Forint';
      case 'PLN':
        return 'Polish Zloty';
      case 'RON':
        return 'Romanian Leu';
      case 'SEK':
        return 'Swedish Krona';
      case 'CHF':
        return 'Swiss Franc';
      case 'ISK':
        return 'Icelandic Króna';
      case 'NOK':
        return 'Norwegian Krone';
      case 'HRK':
        return 'Croatian Kuna';
      case 'RUB':
        return 'Russian Ruble';
      case 'TRY':
        return 'Turkish Lira';
      case 'AUD':
        return 'Australian Dollar';
      case 'BRL':
        return 'Brazilian Real';
      case 'CAD':
        return 'Canadian Dollar';
      case 'CNY':
        return 'Chinese Yuan';
      case 'HKD':
        return 'Hong Kong Dollar';
      case 'IDR':
        return 'Indonesian Rupiah';
      case 'ILS':
        return 'Israeli New Sheqel';
      case 'INR':
        return 'Indian Rupee';
      case 'KRW':
        return 'South Korean Won';
      case 'MXN':
        return 'Mexican Peso';
      case 'MYR':
        return 'Malaysian Ringgit';
      case 'NZD':
        return 'New Zealand Dollar';
      case 'PHP':
        return 'Philippine Peso';
      case 'SGD':
        return 'Singapore Dollar';
      case 'THB':
        return 'Thai Baht';
      case 'ZAR':
        return 'South African Rand';
      default:
        return 'Unknown Currency';
    }
  }

  String _getCurrencyFlag(String code) {
    switch (code) {
      case 'EUR':
        return '🇪🇺';
      case 'USD':
        return '🇺🇸';
      case 'JPY':
        return '🇯🇵';
      case 'BGN':
        return '🇧🇬';
      case 'CZK':
        return '🇨🇿';
      case 'DKK':
        return '🇩🇰';
      case 'GBP':
        return '🇬🇧';
      case 'HUF':
        return '🇭🇺';
      case 'PLN':
        return '🇵🇱';
      case 'RON':
        return '🇷🇴';
      case 'SEK':
        return '🇸🇪';
      case 'CHF':
        return '🇨🇭';
      case 'ISK':
        return '🇮🇸';
      case 'NOK':
        return '🇳🇴';
      case 'HRK':
        return '🇭🇷';
      case 'RUB':
        return '🇷🇺';
      case 'TRY':
        return '🇹🇷';
      case 'AUD':
        return '🇦🇺';
      case 'BRL':
        return '🇧🇷';
      case 'CAD':
        return '🇨🇦';
      case 'CNY':
        return '🇨🇳';
      case 'HKD':
        return '🇭🇰';
      case 'IDR':
        return '🇮🇩';
      case 'ILS':
        return '🇮🇱';
      case 'INR':
        return '🇮🇳';
      case 'KRW':
        return '🇰🇷';
      case 'MXN':
        return '🇲🇽';
      case 'MYR':
        return '🇲🇾';
      case 'NZD':
        return '🇳🇿';
      case 'PHP':
        return '🇵🇭';
      case 'SGD':
        return '🇸🇬';
      case 'THB':
        return '🇹🇭';
      case 'ZAR':
        return '🇿🇦';
      default:
        return '🌍'; // Default for unsupported or unknown currencies
    }
  }
}
