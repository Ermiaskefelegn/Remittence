// lib/domain/usecases/register_usecase.dart
import '../repositories/authentication_repository.dart';
import '../entities/account_entity.dart';

class RegisterUseCase {
  final AuthenticationRepository repository;

  RegisterUseCase(this.repository);

  void execute(AccountEntity account) {
    repository.register(account);
  }
}
