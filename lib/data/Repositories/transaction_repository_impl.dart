// lib/data/repositories/transaction_repository_impl.dart
import 'package:remittance/data/models/transaction_model.dart';
import 'package:remittance/domain/Repositories/transaction_repository.dart';

import '../../domain/entities/transaction_entity.dart';
import '../datasources/transaction_datasource.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionDataSource dataSource;

  TransactionRepositoryImpl(this.dataSource);

  @override
  List<TransactionEntity> getTransactions() {
    return dataSource.transactions.map((transaction) {
      return TransactionEntity(
        transactionId: transaction.transactionId,
        accountNumber: transaction.accountNumber,
        remark: transaction.remark,
        recipient: transaction.recipient,
        amount: transaction.amount,
        date: transaction.date,
      );
    }).toList();
  }

  @override
  void addTransaction(TransactionEntity transaction) {
    dataSource.addTransaction(Transaction(
      remark: transaction.remark,
      accountNumber: transaction.accountNumber,
      transactionId: transaction.transactionId,
      recipient: transaction.recipient,
      amount: transaction.amount,
      date: transaction.date,
    ));
  }
}
