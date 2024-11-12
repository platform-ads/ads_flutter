import 'package:core/entities/customer.dart';
import 'package:equatable_export/equatable.dart';

class CustomerModel extends Equatable {
  const CustomerModel({
    required this.userId,
    required this.username,
    required this.firstLogin,
    required this.role,
    required this.access,
    this.companyName,
    this.companyId,
  });

  final String userId;
  final String username;
  final String? companyName;
  final String? companyId;
  final bool firstLogin;
  final String role;
  final AccessModel access;

  factory CustomerModel.fromEntity(Customer entity) => CustomerModel(
        userId: entity.userId,
        username: entity.username,
        companyName: entity.companyName,
        firstLogin: entity.firstLogin,
        companyId: entity.companyId,
        role: entity.role,
        access: AccessModel.fromEntity(entity.access),
      );

  Customer toEntity() => Customer(
        userId: userId,
        username: username,
        companyName: companyName,
        firstLogin: firstLogin,
        companyId: companyId,
        role: role,
        access: access.toEntity(),
      );

  @override
  List<Object?> get props {
    return [
      userId,
      username,
      companyName,
      companyId,
      firstLogin,
      role,
      access,
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': userId,
      'username': username,
      'company_name': companyName,
      'company_id': companyId,
      'first_login': firstLogin,
      'role': role,
      'access': access.toJson(),
    };
  }

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      userId: json['user_id'],
      username: json['username'],
      companyName: json['company'] ?? '',
      companyId: json['company_id'] ?? '',
      firstLogin: json['first_login'],
      role: json['role'],
      access: AccessModel.fromJson(json['access']),
    );
  }
}

class AccessModel extends Equatable {
  final String token;
  final String refresh;

  const AccessModel({
    required this.token,
    required this.refresh,
  });

  @override
  List<Object> get props => [token, refresh];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'token': token,
      'refresh': refresh,
    };
  }

  factory AccessModel.fromJson(Map<String, dynamic> json) {
    return AccessModel(
      token: json['token'] as String,
      refresh: json['refresh'] as String,
    );
  }
  factory AccessModel.fromEntity(Access entity) {
    return AccessModel(
      token: entity.token,
      refresh: entity.refresh,
    );
  }

  Access toEntity() => Access(token: token, refresh: refresh);
}
