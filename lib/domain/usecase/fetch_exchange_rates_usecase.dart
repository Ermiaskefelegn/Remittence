// lib/domain/usecases/fetch_exchange_rates_usecase.dart

import 'package:remittance/data/Repositories/currency_repository.dart';

class FetchExchangeRatesUseCase {
  final CurrencyRepository repository;

  FetchExchangeRatesUseCase(this.repository);

  Future<Map<String, double>> execute(String baseCurrency) {
    return repository.fetchExchangeRates(baseCurrency);
  }
}
