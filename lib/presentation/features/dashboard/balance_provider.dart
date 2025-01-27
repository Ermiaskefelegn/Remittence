// lib/presentation/features/dashboard/balance_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remittance/presentation/features/authentication/auth_provider.dart';

final balanceProvider = Provider<double>((ref) {
  final account = ref.watch(authStateProvider);
  return account?.balance ?? 0.0;
});
