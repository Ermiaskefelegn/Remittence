// lib/domain/repositories/transaction_repository.dart
import '../entities/transaction_entity.dart';

abstract class TransactionRepository {
  List<TransactionEntity> getTransactions();
  void addTransaction(TransactionEntity transaction);
}
