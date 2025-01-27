// lib/domain/entities/account_entity.dart
class AccountEntity {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String accountNumber;
  final double balance;
  final String password;

  AccountEntity({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.accountNumber,
    required this.balance,
  });
}
