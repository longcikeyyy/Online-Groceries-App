import 'package:injectable/injectable.dart';
import 'package:online_groceries_app/domain/repositories/auth_repository.dart';
import 'package:online_groceries_app/domain/usecase/get_shop_info_usecase.dart';
import 'package:online_groceries_app/domain/usecase/get_user_info_usecase.dart';
import 'package:online_groceries_app/domain/usecase/login_user_usecase.dart';

/// Domain module that provides dependency injection for use cases.
///
/// This module defines how to create and inject domain layer use cases
/// with their required repository dependencies. It uses the @module
/// annotation to mark this class as a dependency injection module.
///
/// Each method in this module is responsible for creating a specific
/// use case instance with its required dependencies injected.
@module
abstract class DomainModule {
  @Injectable()
  LoginUserUsecase loginUserUsecase(IAuthRepository repo) {
    return LoginUserUsecase(repo);
  }

  @Injectable()
  GetUserInfoUsecase getUserInfoUsecase(IAuthRepository repo) {
    return GetUserInfoUsecase(repo);
  }

  @Injectable()
  GetShopInfoUsecase getShopInfoUsecase(IAuthRepository repo) {
    return GetShopInfoUsecase(repo);
}
}
