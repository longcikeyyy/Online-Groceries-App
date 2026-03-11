import 'package:online_groceries_app/domain/core/result.dart';
import 'package:online_groceries_app/domain/core/usecase.dart';
import 'package:online_groceries_app/domain/entities/shop_info_entity.dart';
import 'package:online_groceries_app/domain/repositories/auth_repository.dart';

final class GetShopInfoUsecase extends UsecaseAsync<List<ShopInfoEntity>, NoParams> {
  final IAuthRepository _authRepository;

  GetShopInfoUsecase(this._authRepository);

  @override
  ResultFuture<List<ShopInfoEntity>> call(NoParams params) {
    return _authRepository.getShopInfo();
  }
}
