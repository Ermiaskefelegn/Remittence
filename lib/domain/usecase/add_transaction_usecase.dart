// lib/domain/usecases/add_transaction_usecase.dart
import 'package:remittance/domain/Repositories/transaction_repository.dart';

import '../entities/transaction_entity.dart';

class AddTransactionUseCase {
  final TransactionRepository repository;

  AddTransactionUseCase(this.repository);

  void execute(TransactionEntity transaction) {
    repository.addTransaction(transaction);
  }
}
