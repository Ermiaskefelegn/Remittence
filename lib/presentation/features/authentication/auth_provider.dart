// lib/presentation/features/authentication/auth_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remittance/data/models/account_models.dart';
import '../../../data/datasources/authentication_datasource.dart';

final authDataSourceProvider = Provider((ref) => AuthenticationDataSource());

final authStateProvider = StateNotifierProvider<AuthNotifier, Account?>((ref) {
  return AuthNotifier(ref.watch(authDataSourceProvider));
});

class AuthNotifier extends StateNotifier<Account?> {
  final AuthenticationDataSource _dataSource;

  AuthNotifier(this._dataSource) : super(null);

  void login(String email, String password) {
    final account = _dataSource.login(email, password);
    if (account != null) {
      state = account;
    }
  }

  void register(Account account) {
    _dataSource.register(account);
    state = account;
  }

  void logout() {
    state = null;
  }
}
