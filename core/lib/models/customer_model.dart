import 'package:core/entities/customer.dart';
import 'package:equatable_export/equatable.dart';

class CustomerModel extends Equatable {
  const CustomerModel({
    required this.username,
    required this.firstLogin,
    required this.role,
    required this.access,
    this.companyName,
    this.companyId,
  });

  final String username;
  final String? companyName;
  final String? companyId;
  final bool firstLogin;
  final String role;
  final AccessModel access;

  factory CustomerModel.fromEntity(Customer entity) => CustomerModel(
        username: entity.username,
        companyName: entity.companyName,
        firstLogin: entity.firstLogin,
        companyId: entity.companyId,
        role: entity.role,
        access: AccessModel.fromEntity(entity.access),
      );

  Customer toEntity() => Customer(
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
      'username': username,
      'companyName': companyName,
      'companyId': companyId,
      'firstLogin': firstLogin,
      'role': role,
      'access': access.toJson(),
    };
  }

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      username: json['username'],
      companyName: json['company_name'] ?? '',
      companyId: json['company_id'] ?? '',
      firstLogin: json['firstLogin'],
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
