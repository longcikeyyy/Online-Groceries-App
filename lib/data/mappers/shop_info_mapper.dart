import 'package:online_groceries_app/data/models/response/shop_info_dto.dart';
import 'package:online_groceries_app/domain/entities/shop_info_entity.dart';

extension ShopInfoMapper on ProductDto {
  ShopInfoEntity toEntity() {
    return ShopInfoEntity(
      id: id,
      title: title,
      price: price.toString(),
      weight: weight.toString(),
      imageUrl: thumbnail,
    );
  }
}