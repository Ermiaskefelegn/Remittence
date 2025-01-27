// lib/domain/usecases/get_transactions_usecase.dart
import 'package:remittance/domain/Repositories/transaction_repository.dart';

import '../entities/transaction_entity.dart';

class GetTransactionsUseCase {
  final TransactionRepository repository;

  GetTransactionsUseCase(this.repository);

  List<TransactionEntity> execute() {
    return repository.getTransactions();
  }
}
