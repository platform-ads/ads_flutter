import 'package:core/main.dart';

abstract class HomeRemoteDatasource {
  Future<String> updateUserFirstLogin(String userId);
}

class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  final ApiClient apiClient;

  HomeRemoteDatasourceImpl(this.apiClient);

  @override
  Future<String> updateUserFirstLogin(String userId) async {
    try {
      final response = await apiClient.patchRequest(
        endpoint: 'users/$userId/',
        data: {
          'first_login': false,
        },
      );
      return response.statusCode == 200 ? 'Ok' : '';
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
