abstract class ProductDetailEvent {}

class OnGetProductDetail extends ProductDetailEvent {
  final int productId;
  OnGetProductDetail(this.productId);
}

class OnToggleFavorite extends ProductDetailEvent {}

class OnChangeQuantity extends ProductDetailEvent {
  final int quantity;
  OnChangeQuantity(this.quantity);
}
