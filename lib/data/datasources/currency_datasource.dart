import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/currency_model.dart';

class CurrencyDataSource {
  final String baseUrl = "https://api.freecurrencyapi.com/v1";
  final String apiKey = "fca_live_5JrXZbvtttJX3Ui5toKe2ZNWv6ZLiS02XDLepcCF";

  Future<List<CurrencyModel>> fetchCurrencies() async {
    final response =
        await http.get(Uri.parse("$baseUrl/currencies?apikey=$apiKey"));

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data'] as Map<String, dynamic>;

      return data.entries.map((entry) {
        return CurrencyModel(
          code: entry.key,
          name: entry.value['name'],
          symbol: entry.value['symbol'],
          flag: _getFlag(entry.key),
        );
      }).toList();
    } else {
      throw Exception("Failed to fetch currencies");
    }
  }

  Future<Map<String, double>> fetchExchangeRates(String baseCurrency) async {
    final response = await http.get(Uri.parse(
      "$baseUrl/latest?apikey=$apiKey&base_currency=$baseCurrency",
    ));

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data'] as Map<String, dynamic>;
      return data.map((key, value) => MapEntry(key, value.toDouble()));
    } else {
      throw Exception("Failed to fetch exchange rates");
    }
  }

  // Mock implementation of flags based on currency codes
  String _getFlag(String code) {
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
