// lib/domain/usecases/login_usecase.dart
import '../repositories/authentication_repository.dart';
import '../entities/account_entity.dart';

class LoginUseCase {
  final AuthenticationRepository repository;

  LoginUseCase(this.repository);

  AccountEntity? execute(String phoneNumber, String password) {
    return repository.login(phoneNumber, password);
  }
}
