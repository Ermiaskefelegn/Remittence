// lib/data/models/transaction_model.dart
class Transaction {
  final String transactionId;
  final String recipient;
  final DateTime date;
  final double amount;

  Transaction({
    required this.transactionId,
    required this.recipient,
    required this.date,
    required this.amount,
  });
}
