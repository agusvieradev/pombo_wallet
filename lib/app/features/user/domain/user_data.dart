import 'package:pombo_wallet/app/features/account/domain/account.dart';

class UserData {
  const UserData({
    required this.uid,
    required this.name,
    required this.account,
    required this.address,
    required this.email,
    required this.phone,
  });
  final String uid;
  final String name;
  final String address;
  final String email;
  final String phone;
  final List<Account> account;
}
