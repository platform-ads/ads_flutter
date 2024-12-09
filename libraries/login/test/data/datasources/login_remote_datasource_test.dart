import 'package:core/main.dart';
import 'package:core/models/customer_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login/src/data/datasources/login_remote_datasource.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock/response_mock.dart';

class MockApiClient extends Mock implements ApiClient {}

void main() {
  late LoginRemoteDatasourceImpl remoteDatasourceImpl;
  late MockApiClient mockApiClient;

  setUp(() {
    mockApiClient = MockApiClient();
    remoteDatasourceImpl = LoginRemoteDatasourceImpl(mockApiClient);
  });

  group("Login Remote DataSource", () {
    const username = 'test_user';
    const password = 'admin123';
    const endpoint = '/login';

    test('Should return CustumerModel on sucess Api Login', () async {
      when(() => mockApiClient.postRequest(
            endpoint: endpoint,
            data: {'username': username, 'password': password},
          )).thenAnswer(
        (_) async => Response(
          data: loginResponseFromJson,
          requestOptions: RequestOptions(),
          statusCode: 200,
        ),
      );
      final result = await remoteDatasourceImpl.loginToAPi(username, password);

      expect(result, isA<CustomerModel>());
      expect(result?.username, equals('test_user'));
      verify(() => mockApiClient.postRequest(
            endpoint: endpoint,
            data: {'username': username, 'password': password},
          )).called(1);
    });
  });
}
