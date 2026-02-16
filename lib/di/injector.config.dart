// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:online_groceries_app/core/env/app_config.dart' as _i63;
import 'package:online_groceries_app/core/logging/console_app_logger.dart'
    as _i84;
import 'package:online_groceries_app/data/core/interceptors.dart' as _i446;
import 'package:online_groceries_app/data/datasources/local/local_storage_datasource.dart'
    as _i928;
import 'package:online_groceries_app/data/datasources/local/local_storage_datasource_impl.dart'
    as _i1013;
import 'package:online_groceries_app/data/datasources/remote/api_service.dart'
    as _i206;
import 'package:online_groceries_app/data/repositories/auth_repository_impl.dart'
    as _i850;
import 'package:online_groceries_app/data/repositories/local_storage_impl.dart'
    as _i522;
import 'package:online_groceries_app/di/domain_module.dart' as _i50;
import 'package:online_groceries_app/di/env_module.dart' as _i788;
import 'package:online_groceries_app/di/third_party_module.dart' as _i801;
import 'package:online_groceries_app/domain/core/app_logger.dart' as _i596;
import 'package:online_groceries_app/domain/repositories/auth_repository.dart'
    as _i643;
import 'package:online_groceries_app/domain/repositories/local_storage_repository.dart'
    as _i284;
import 'package:online_groceries_app/domain/usecase/login_user_usecase.dart'
    as _i755;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

const String _dev = 'dev';
const String _staging = 'staging';
const String _prod = 'prod';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final thirdPartyModule = _$ThirdPartyModule();
    final envModule = _$EnvModule();
    final domainModule = _$DomainModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => thirdPartyModule.prefs,
      preResolve: true,
    );
    gh.factory<_i558.FlutterSecureStorage>(
      () => thirdPartyModule.secureStorage(),
    );
    gh.lazySingleton<_i596.AppLogger>(() => _i84.ConsoleAppLogger());
    gh.singleton<_i63.AppConfig>(
      () => envModule.devConfig(),
      registerFor: {_dev},
    );
    gh.singleton<_i63.AppConfig>(
      () => envModule.stagingConfig(),
      registerFor: {_staging},
    );
    gh.singleton<_i928.ILocalStorageDataSource>(
      () => _i1013.LocalStorageDataSourceImpl(
        gh<_i460.SharedPreferences>(),
        gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.singleton<_i63.AppConfig>(
      () => envModule.prodConfig(),
      registerFor: {_prod},
    );
    gh.factory<String>(
      () => envModule.prodBaseUrl(gh<_i63.AppConfig>()),
      instanceName: 'baseUrl',
      registerFor: {_prod},
    );
    gh.factory<String>(
      () => envModule.devBaseUrl(gh<_i63.AppConfig>()),
      instanceName: 'baseUrl',
      registerFor: {_dev},
    );
    gh.factory<String>(
      () => envModule.stagingBaseUrl(gh<_i63.AppConfig>()),
      instanceName: 'baseUrl',
      registerFor: {_staging},
    );
    gh.singleton<_i284.ILocalStorage>(
      () => _i522.LocalStorageImpl(gh<_i928.ILocalStorageDataSource>()),
    );
    gh.lazySingleton<_i446.NetworkInterceptor>(
      () => _i446.NetworkInterceptor(
        gh<_i284.ILocalStorage>(),
        gh<_i596.AppLogger>(),
      ),
    );
    gh.factory<_i361.Dio>(
      () => thirdPartyModule.dio(
        gh<_i63.AppConfig>(),
        gh<String>(instanceName: 'baseUrl'),
        gh<_i446.NetworkInterceptor>(),
      ),
    );
    gh.lazySingleton<_i206.ApiService>(() => _i206.ApiService(gh<_i361.Dio>()));
    gh.lazySingleton<_i643.IAuthRepository>(
      () => _i850.AuthRepositoryImpl(gh<_i206.ApiService>()),
    );
    gh.factory<_i755.LoginUserUsecase>(
      () => domainModule.loginUserUsecase(gh<_i643.IAuthRepository>()),
    );
    return this;
  }
}

class _$ThirdPartyModule extends _i801.ThirdPartyModule {}

class _$EnvModule extends _i788.EnvModule {}

class _$DomainModule extends _i50.DomainModule {}
