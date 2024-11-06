import 'package:equatable_export/equatable.dart';
import 'package:flutter_bloc_export/flutter_bloc.dart';
import 'package:home/src/domain/repositories/send_code_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SendCodeRepository sendCodeRepository;
  AuthCubit(this.sendCodeRepository) : super(AuthInitial());

  Future<String?> sendCode({
    required String code,
    required String appId,
    required String clientSecret,
  }) async {
    emit(AuthLoading());
    final response = await sendCodeRepository.sendCode(code, appId, clientSecret);
    if (response != null) {
      emit(AuthSuccess(response));
    } else {
      emit(AuthError());
    }
    return null;
  }
}
