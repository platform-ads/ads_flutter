import 'package:core/models/customer_model.dart';

final loginResponse = CustomerModel.fromJson(loginResponseFromJson);
final loginResponseEntity = loginResponse.toEntity();
const loginResponseFromJson = {
  "userId": "1",
  "username": "Test",
  "firstLogin": true,
  "role": " ",
  "acess": AccessModel(token: "", refresh: ""),
};




/*
final String userId;
  final String username;
  final String? companyName;
  final String? companyId;
  final bool firstLogin;
  final String role;
  final AccessModel access;



*/