// lib/data/datasources/transaction_datasource.dart
import '../models/transaction_model.dart';

class TransactionDataSource {
  final List<Transaction> _transactions = [];

  List<Transaction> get transactions => _transactions;

  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);
  }
}
