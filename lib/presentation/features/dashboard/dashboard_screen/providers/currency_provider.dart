// lib/presentation/providers/currency_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remittance/data/datasources/currency_datasource.dart';
import 'package:remittance/domain/Repositories/currency_repository_impl.dart';
import 'package:remittance/domain/entities/currency_entity.dart';
import 'package:remittance/domain/usecase/fetch_currencies_usecase.dart';
import 'package:remittance/domain/usecase/fetch_exchange_rates_usecase.dart';

// DataSource Provider
final currencyDataSourceProvider = Provider((ref) => CurrencyDataSource());

// Repository Provider
final currencyRepositoryProvider = Provider((ref) {
  final dataSource = ref.watch(currencyDataSourceProvider);
  return CurrencyRepositoryImpl(dataSource);
});

// FetchCurrenciesUseCase Provider
final fetchCurrenciesUseCaseProvider = Provider((ref) {
  final repository = ref.watch(currencyRepositoryProvider);
  return FetchCurrenciesUseCase(repository);
});

// FetchExchangeRatesUseCase Provider
final fetchExchangeRatesUseCaseProvider = Provider((ref) {
  final repository = ref.watch(currencyRepositoryProvider);
  return FetchExchangeRatesUseCase(repository);
});

// Selected currency provider (user-selected currency)
final selectedCurrencyProvider = StateProvider<CurrencyEntity?>((ref) => null);

// Base currency provider (e.g., USD, EUR, etc.)
final baseCurrencyProvider = StateProvider<String>((ref) => "USD");

// Fetch currencies provider
final fetchCurrenciesProvider = FutureProvider<List<CurrencyEntity>>((ref) {
  final fetchCurrenciesUseCase = ref.read(fetchCurrenciesUseCaseProvider);
  return fetchCurrenciesUseCase.execute();
});

// Fetch exchange rates provider
final exchangeRatesProvider = FutureProvider<Map<String, double>>((ref) {
  final fetchExchangeRatesUseCase = ref.read(fetchExchangeRatesUseCaseProvider);
  final baseCurrency = ref.watch(baseCurrencyProvider); // Watch base currency
  return fetchExchangeRatesUseCase.execute(baseCurrency);
});
