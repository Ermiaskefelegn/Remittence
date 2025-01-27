// lib/presentation/features/transactions/transaction_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remittance/data/Repositories/transaction_repository_impl.dart';
import 'package:remittance/data/datasources/transaction_datasource.dart';
import 'package:remittance/domain/Repositories/transaction_repository.dart';
import 'package:remittance/domain/entities/transaction_entity.dart';
import 'package:remittance/domain/usecase/add_transaction_usecase.dart';
import 'package:remittance/domain/usecase/get_transactions_usecase.dart';

// Provide the data source
final transactionDataSourceProvider =
    Provider((ref) => TransactionDataSource());

// Provide the repository
final transactionRepositoryProvider = Provider<TransactionRepository>((ref) {
  final dataSource = ref.watch(transactionDataSourceProvider);
  return TransactionRepositoryImpl(dataSource);
});

// Get Transactions Provider
final getTransactionsProvider = Provider((ref) {
  final repository = ref.watch(transactionRepositoryProvider);
  return GetTransactionsUseCase(repository);
});

// Add Transaction Provider
final addTransactionProvider = Provider((ref) {
  final repository = ref.watch(transactionRepositoryProvider);
  return AddTransactionUseCase(repository);
});

// Transaction List State Provider
final transactionListProvider =
    StateNotifierProvider<TransactionNotifier, List<TransactionEntity>>((ref) {
  final getTransactionsUseCase = ref.watch(getTransactionsProvider);
  final addTransactionUseCase = ref.watch(addTransactionProvider);
  return TransactionNotifier(getTransactionsUseCase, addTransactionUseCase);
});

// State Notifier for Transactions
class TransactionNotifier extends StateNotifier<List<TransactionEntity>> {
  final GetTransactionsUseCase _getTransactionsUseCase;
  final AddTransactionUseCase _addTransactionUseCase;

  TransactionNotifier(this._getTransactionsUseCase, this._addTransactionUseCase)
      : super([]) {
    _loadTransactions();
  }

  void _loadTransactions() {
    state = _getTransactionsUseCase.execute();
  }

  void addTransaction(TransactionEntity transaction) {
    _addTransactionUseCase.execute(transaction);
    _loadTransactions(); // Refresh the state after adding
  }
}
