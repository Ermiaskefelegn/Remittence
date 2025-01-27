// lib/presentation/features/dashboard/transaction_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/datasources/transaction_datasource.dart';
import '../../../data/models/transaction_model.dart';

final transactionDataSourceProvider =
    Provider((ref) => TransactionDataSource());

final transactionListProvider = Provider<List<Transaction>>((ref) {
  return ref.watch(transactionDataSourceProvider).transactions;
});
