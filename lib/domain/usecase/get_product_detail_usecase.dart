import 'package:online_groceries_app/domain/core/result.dart';
import 'package:online_groceries_app/domain/core/usecase.dart';
import 'package:online_groceries_app/domain/entities/product_detail_entity.dart';
import 'package:online_groceries_app/domain/repositories/product_repository.dart';

class GetProductDetailParams {
  final int id;
  GetProductDetailParams(this.id);
}

final class GetProductDetailUsecase
    extends UsecaseAsync<ProductDetailEntity, GetProductDetailParams> {
  final IProductRepository _productRepository;

  GetProductDetailUsecase(this._productRepository);

  @override
  ResultFuture<ProductDetailEntity> call(GetProductDetailParams params) {
    return _productRepository.getProductDetail(params.id);
  }
}
