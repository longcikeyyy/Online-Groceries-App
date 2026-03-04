import 'package:online_groceries_app/domain/core/result.dart';
import 'package:online_groceries_app/domain/core/usecase.dart';
import 'package:online_groceries_app/domain/entities/user_info_entity.dart';
import 'package:online_groceries_app/domain/repositories/auth_repository.dart';

final class GetUserInfoUsecase extends UsecaseAsync<UserInfoEntity, NoParams> {
  final IAuthRepository _authRepository;

  GetUserInfoUsecase(this._authRepository);

  @override
  ResultFuture<UserInfoEntity> call(NoParams params) {
    return _authRepository.getUserInfo();
  }
}
