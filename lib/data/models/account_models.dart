// lib/data/models/account_model.dart
class Account {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String password;
  final String accountNumber;
  double balance;

  Account({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.accountNumber,
    this.balance = 100.0,
  });
}
