// lib/domain/repositories/currency_repository.dart

import 'package:remittance/domain/entities/currency_entity.dart';

abstract class CurrencyRepository {
  Future<List<CurrencyEntity>> fetchCurrencies();
  Future<Map<String, double>> fetchExchangeRates(String baseCurrency);
}
