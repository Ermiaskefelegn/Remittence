// lib/domain/usecases/fetch_currencies_usecase.dart

import 'package:remittance/data/Repositories/currency_repository.dart';
import 'package:remittance/domain/entities/currency_entity.dart';

class FetchCurrenciesUseCase {
  final CurrencyRepository repository;

  FetchCurrenciesUseCase(this.repository);

  Future<List<CurrencyEntity>> execute() {
    return repository.fetchCurrencies();
  }
}
