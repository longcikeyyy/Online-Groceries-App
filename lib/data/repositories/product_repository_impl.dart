import 'package:injectable/injectable.dart';
import 'package:online_groceries_app/data/core/guard.dart';
import 'package:online_groceries_app/data/datasources/remote/api_service.dart';
import 'package:online_groceries_app/data/mappers/product_detail_mapper.dart';
import 'package:online_groceries_app/data/mappers/shop_info_mapper.dart';
import 'package:online_groceries_app/domain/core/result.dart';
import 'package:online_groceries_app/domain/entities/product_detail_entity.dart';
import 'package:online_groceries_app/domain/entities/shop_info_entity.dart';
import 'package:online_groceries_app/domain/repositories/product_repository.dart';

@LazySingleton(as: IProductRepository)
class ProductRepositoryImpl extends IProductRepository {
  final ApiService _apiService;

  ProductRepositoryImpl(this._apiService);

  @override
  ResultFuture<List<ShopInfoEntity>> getShopInfo() {
    return guardDio<List<ShopInfoEntity>>(() async {
      final shopInfoDto = await _apiService.getShopInfo();
      return shopInfoDto.products.map((product) => product.toEntity()).toList();
    });
  }

  @override
  ResultFuture<ProductDetailEntity> getProductDetail(int id) {
    return guardDio<ProductDetailEntity>(() async {
      final productDto = await _apiService.getProductDetail(id);
      return productDto.toDetailEntity();
    });
  }
}
