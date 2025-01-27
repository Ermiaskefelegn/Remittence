// implment authentication repository
// lib/data/repositories/authentication_repository_impl.dart
import 'package:remittance/data/models/account_models.dart';

import '../../domain/repositories/authentication_repository.dart';
import '../../domain/entities/account_entity.dart';
import '../datasources/authentication_datasource.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationDataSource dataSource;

  AuthenticationRepositoryImpl(this.dataSource);

  @override
  AccountEntity? login(String phoneNumber, String password) {
    final account = dataSource.login(phoneNumber, password);
    if (account != null) {
      return AccountEntity(
        firstName: account.firstName,
        lastName: account.lastName,
        email: account.email,
        password: account.password,
        phoneNumber: account.phoneNumber,
        accountNumber: account.accountNumber,
        balance: account.balance,
      );
    }
    return null;
  }

  @override
  void register(AccountEntity account) {
    dataSource.register(
      Account(
        firstName: account.firstName,
        lastName: account.lastName,
        email: account.email,
        phoneNumber: account.phoneNumber,
        password: account.password,
        accountNumber: account.accountNumber,
        balance: account.balance,
      ),
    );
  }
}
