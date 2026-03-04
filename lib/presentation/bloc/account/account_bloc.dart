import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_groceries_app/domain/core/usecase.dart';
import 'package:online_groceries_app/domain/usecase/get_user_info_usecase.dart';
import 'package:online_groceries_app/presentation/bloc/account/account_event.dart';
import 'package:online_groceries_app/presentation/bloc/account/account_state.dart';
import 'package:online_groceries_app/presentation/error/failure_mapper.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final GetUserInfoUsecase _getUserInfoUsecase;
  final FailureMapper _failureMapper;

  AccountBloc(this._getUserInfoUsecase, this._failureMapper)
    : super(const AccountState()) {
    on<OnGetUserInfo>(_getUserInfo);
  }

  Future<void> _getUserInfo(
    OnGetUserInfo event,
    Emitter<AccountState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      final result = await _getUserInfoUsecase.call(NoParams());
      result.fold(
        (failure) {
          emit(
            state.copyWith(
              isLoading: false,
              apiErrorMessage: _failureMapper.mapFailureToMessage(failure),
            ),
          );
        },
        (success) {
          emit(state.copyWith(isLoading: false, userInfo: success));
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          apiErrorMessage: 'An unexpected error occurred.',
        ),
      );
    }
  }
}
