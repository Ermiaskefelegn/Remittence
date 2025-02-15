// lib/data/models/transaction_model.dart
class Transaction {
  final String transactionId;
  final String recipient;
  final String remark;
  final String accountNumber;
  final DateTime date;
  final double amount;

  Transaction({
    required this.remark,
    required this.accountNumber,
    required this.transactionId,
    required this.recipient,
    required this.date,
    required this.amount,
  });
}
