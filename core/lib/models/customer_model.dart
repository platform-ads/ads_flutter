import 'package:core/entities/customer.dart';
import 'package:equatable_export/equatable.dart';

class CustomerModel extends Equatable {
  final String name;
  final String companyName;
  final bool firstLogin;
  const CustomerModel({
    required this.name,
    required this.companyName,
    required this.firstLogin,
  });

  CustomerModel copyWith({
    String? name,
    String? companyName,
    bool? firstLogin,
  }) {
    return CustomerModel(
      name: name ?? this.name,
      companyName: companyName ?? this.companyName,
      firstLogin: firstLogin ?? this.firstLogin,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'company_name': companyName,
      'first_login': firstLogin,
    };
  }

  factory CustomerModel.fromJson(Map<String, dynamic> map) {
    return CustomerModel(
      name: map['name'] as String,
      companyName: map['company_name'] as String,
      firstLogin: map['first_login'] as bool,
    );
  }

  factory CustomerModel.fromEntity(Customer entity) => CustomerModel(
        name: entity.name,
        companyName: entity.companyName,
        firstLogin: entity.firstLogin,
      );

  Customer toEntity() => Customer(
        name,
        companyName,
        firstLogin,
      );

  @override
  List<Object> get props => [name, companyName, firstLogin];
}
