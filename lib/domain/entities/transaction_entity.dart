// lib/domain/entities/transaction_entity.dart
class TransactionEntity {
  final String transactionId;
  final String recipient;
  final double amount;
  final String remark;
  final String accountNumber;
  final DateTime date;

  TransactionEntity({
    required this.remark,
    required this.accountNumber,
    required this.transactionId,
    required this.recipient,
    required this.amount,
    required this.date,
  });
}
