// lib/data/datasources/exchange_rate_datasource.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:remittance/core/api_constants/api_constants.dart';
import '../models/exchange_rate_model.dart';

class ExchangeRateDataSource {
  Future<ExchangeRate> fetchExchangeRates() async {
    final response = await http.get(
      Uri.parse(
          '${ApiConstants.baseUrl}?apikey=${ApiConstants.apiKey}&currencies=EUR,USD,CAD,GBP&base_currency=${ApiConstants.baseCurrency}'),
    );
    if (response.statusCode == 200) {
      return ExchangeRate.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load exchange rates');
    }
  }
}
