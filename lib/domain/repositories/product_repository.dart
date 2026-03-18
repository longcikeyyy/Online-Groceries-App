import 'package:online_groceries_app/domain/core/result.dart';
import 'package:online_groceries_app/domain/entities/product_detail_entity.dart';
import 'package:online_groceries_app/domain/entities/shop_info_entity.dart';

abstract class IProductRepository {
  ResultFuture<List<ShopInfoEntity>> getShopInfo();
  ResultFuture<ProductDetailEntity> getProductDetail(int id);
}
