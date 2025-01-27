// lib/data/datasources/authentication_datasource.dart

import 'package:remittance/data/models/account_models.dart';

class AuthenticationDataSource {
  final List<Account> _accounts = [];

  List<Account> get accounts => _accounts;

  Account? login(String email, String password) {
    try {
      return _accounts.firstWhere(
        (account) => account.email == email && account.password == password,
      );
    } catch (e) {
      return null;
    }
  }

  void register(Account account) {
    _accounts.add(account);
  }
}
