// lib/presentation/features/authentication/auth_provider.dart
// lib/presentation/features/authentication/auth_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remittance/data/Repositories/authentication_repository.dart';
import 'package:remittance/domain/usecase/login_usecase.dart';
import 'package:remittance/domain/usecase/register_usecase.dart';
import '../../../data/datasources/authentication_datasource.dart';
import '../../../domain/entities/account_entity.dart';

// Provide the data source
final authDataSourceProvider = Provider((ref) => AuthenticationDataSource());

// Provide the repository
final authRepositoryProvider = Provider((ref) {
  final dataSource = ref.watch(authDataSourceProvider);
  return AuthenticationRepositoryImpl(dataSource);
});

// Provide the use cases
final loginUseCaseProvider = Provider((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return LoginUseCase(repository);
});

final registerUseCaseProvider = Provider((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return RegisterUseCase(repository);
});

// Authentication State Notifier
final authStateProvider =
    StateNotifierProvider<AuthNotifier, AccountEntity?>((ref) {
  final loginUseCase = ref.watch(loginUseCaseProvider);
  final registerUseCase = ref.watch(registerUseCaseProvider);
  return AuthNotifier(loginUseCase, registerUseCase);
});

// State Notifier Implementation
class AuthNotifier extends StateNotifier<AccountEntity?> {
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;

  AuthNotifier(this._loginUseCase, this._registerUseCase) : super(null);

  void login(String phoneNumber, String password) {
    final account = _loginUseCase.execute(phoneNumber, password);
    if (account != null) {
      state = account;
    } else {
      state = null;
    }
  }

  void register(AccountEntity account) {
    _registerUseCase.execute(account);
    state = account;
  }

  void logout() {
    state = null;
  }
}
