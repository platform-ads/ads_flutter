import 'package:equatable_export/equatable.dart';

class Customer extends Equatable {
  final String userId;
  final String username;
  final String? companyName;
  final String? companyId;
  final bool firstLogin;
  final String role;
  final Access access;

  const Customer({
    required this.userId,
    required this.username,
    required this.companyName,
    required this.companyId,
    required this.firstLogin,
    required this.role,
    required this.access,
  });

  @override
  List<Object?> get props => [
        userId,
        username,
        companyName,
        companyId,
        firstLogin,
        role,
        access,
      ];
}

class Access extends Equatable {
  final String token;
  final String refresh;

  const Access({
    required this.token,
    required this.refresh,
  });

  @override
  List<Object> get props => [token, refresh];
}
