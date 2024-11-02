import 'package:equatable_export/equatable.dart';

class Customer extends Equatable {
  final String name;
  final String companyName;
  final bool firstLogin;

  const Customer(this.name, this.companyName, this.firstLogin);

  @override
  List<Object> get props => [name, companyName, firstLogin];
}
