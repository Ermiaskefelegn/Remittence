// lib/domain/entities/currency_entity.dart
class CurrencyEntity {
  final String code;
  final String name;
  final String flag;
  final String symbol;

  CurrencyEntity({
    required this.symbol,
    required this.code,
    required this.name,
    required this.flag,
  });
}
