// lib/data/models/exchange_rate_model.dart
class ExchangeRate {
  final Map<String, double> rates;

  ExchangeRate({required this.rates});

  factory ExchangeRate.fromJson(Map<String, dynamic> json) {
    return ExchangeRate(
      rates: Map<String, double>.from(json['data']),
    );
  }
}
