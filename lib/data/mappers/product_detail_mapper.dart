import 'package:online_groceries_app/data/models/response/shop_info_dto.dart';
import 'package:online_groceries_app/domain/entities/product_detail_entity.dart';

extension ProductDetailMapper on ProductDto {
  ProductDetailEntity toDetailEntity() {
    return ProductDetailEntity(
      id: id,
      title: title ?? '---',
      description: description ?? 'No description available.',
      category: category ?? 'Others',
      price: price ?? 0.0,
      discountPercentage: discountPercentage ?? 0.0,
      rating: rating ?? 0.0,
      stock: stock ?? 0,
      brand: brand ?? '---',
      weight: weight ?? 0,
      warrantyInformation: warrantyInformation ?? 'No warranty information.',
      shippingInformation: shippingInformation ?? 'No shipping information.',
      availabilityStatus: availabilityStatus ?? 'Unknown',
      returnPolicy: returnPolicy ?? 'No return policy.',
      images: images ?? (thumbnail != null ? [thumbnail!] : []),
      thumbnail: thumbnail ?? '',
      reviews:
          reviews
              ?.map(
                (r) => ProductReviewEntity(
                  rating: r.rating ?? 0,
                  comment: r.comment ?? '',
                  date: r.date ?? '',
                  reviewerName: r.reviewerName ?? 'Anonymous',
                ),
              )
              .toList() ??
          [],
    );
  }
}
