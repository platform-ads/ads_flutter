import 'package:equatable_export/equatable.dart';
import 'package:flutter_bloc_export/flutter_bloc.dart';
import 'package:home/src/domain/repositories/update_first_login_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final UpdateFirstLoginRepository updateFirstLoginRepository;
  HomeCubit(this.updateFirstLoginRepository) : super(HomeInitial());

  Future<void> updateFirstLogin(String userId) async {
    emit(HomeLoading());

    var result = await updateFirstLoginRepository(userId);

    if (result.isNotEmpty) {
      emit(HomeSuccess(result));
    } else {
      emit(HomeError());
    }
  }
}
