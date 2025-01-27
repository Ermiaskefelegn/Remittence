// lib/data/datasources/authentication_datasource.dart

import 'package:remittance/data/models/account_models.dart';

class AuthenticationDataSource {
  final List<Account> _accounts = [
    Account(
      firstName: 'John',
      lastName: 'Doe',
      email: 'john.doe@example.com',
      phoneNumber: '1234567890',
      password: 'password123',
      accountNumber: '1000001',
    ),
    Account(
      firstName: 'Jane',
      lastName: 'Smith',
      email: 'jane.smith@example.com',
      phoneNumber: '0987654321',
      password: 'secure456',
      accountNumber: '1000002',
    ),
    Account(
      firstName: 'Alice',
      lastName: 'Brown',
      email: 'alice.brown@example.com',
      phoneNumber: '5551234567',
      password: 'alice789',
      accountNumber: '1000003',
    ),
  ];

  List<Account> get accounts => _accounts;

  Account? login(String phonenumber, String password) {
    try {
      return _accounts.firstWhere(
        (account) =>
            account.phoneNumber == phonenumber && account.password == password,
      );
    } catch (e) {
      return null;
    }
  }

  void register(Account account) {
    _accounts.add(account);
  }
}
