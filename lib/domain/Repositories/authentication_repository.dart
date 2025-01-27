// lib/domain/repositories/authentication_repository.dart
import '../entities/account_entity.dart';

abstract class AuthenticationRepository {
  AccountEntity? login(String phoneNumber, String password);
  void register(AccountEntity account);
}
