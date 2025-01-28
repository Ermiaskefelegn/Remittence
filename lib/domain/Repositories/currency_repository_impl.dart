// lib/data/repositories/currency_repository_impl.dart

import 'package:remittance/data/Repositories/currency_repository.dart';
import 'package:remittance/data/datasources/currency_datasource.dart';
import 'package:remittance/domain/entities/currency_entity.dart';

class CurrencyRepositoryImpl implements CurrencyRepository {
  final CurrencyDataSource dataSource;

  CurrencyRepositoryImpl(this.dataSource);

  @override
  Future<List<CurrencyEntity>> fetchCurrencies() async {
    final currencies = await dataSource.fetchCurrencies();
    return currencies.map((currency) {
      return CurrencyEntity(
        code: currency.code,
        name: currency.name,
        symbol: currency.symbol,
        flag: currency.flag,
      );
    }).toList();
  }

  @override
  Future<Map<String, double>> fetchExchangeRates(String baseCurrency) {
    return dataSource.fetchExchangeRates(baseCurrency);
  }
}
