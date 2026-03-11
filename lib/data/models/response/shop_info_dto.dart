import 'package:json_annotation/json_annotation.dart';

part 'shop_info_dto.g.dart';

/// Data transfer object representing the shop information response.
///
/// This class encapsulates the product catalog returned from the shop API endpoint.
/// It uses JSON serialization to convert between Dart objects and JSON data.
///
/// Example usage:
/// ```dart
/// final shopInfo = ShopInfoDto.fromJson(jsonResponse);
/// print('Total products: ${shopInfo.products.length}');
/// ```
@JsonSerializable()
class ShopInfoDto {
  final List<ProductDto> products;

  ShopInfoDto({required this.products});

  factory ShopInfoDto.fromJson(Map<String, dynamic> json) =>
      _$ShopInfoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ShopInfoDtoToJson(this);
}

/// Data transfer object representing product dimensions.
@JsonSerializable()
class DimensionsDto {
  final double? width;
  final double? height;
  final double? depth;

  DimensionsDto({this.width, this.height, this.depth});

  factory DimensionsDto.fromJson(Map<String, dynamic> json) =>
      _$DimensionsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DimensionsDtoToJson(this);
}

/// Data transfer object representing a product review.
@JsonSerializable()
class ReviewDto {
  final int? rating;
  final String? comment;
  final String? date;
  final String? reviewerName;
  final String? reviewerEmail;

  ReviewDto({
    this.rating,
    this.comment,
    this.date,
    this.reviewerName,
    this.reviewerEmail,
  });

  factory ReviewDto.fromJson(Map<String, dynamic> json) =>
      _$ReviewDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewDtoToJson(this);
}

/// Data transfer object representing product metadata.
@JsonSerializable()
class MetaDto {
  final String? createdAt;
  final String? updatedAt;
  final String? barcode;
  final String? qrCode;

  MetaDto({this.createdAt, this.updatedAt, this.barcode, this.qrCode});

  factory MetaDto.fromJson(Map<String, dynamic> json) =>
      _$MetaDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MetaDtoToJson(this);
}

/// Data transfer object representing a product.
///
/// This class contains all the information about a single product including
/// basic details, pricing, inventory, dimensions, reviews, and metadata.
@JsonSerializable()
class ProductDto {
  final int id;
  final String? title;
  final String? description;
  final String? category;
  final double? price;
  final double? discountPercentage;
  final double? rating;
  final int? stock;
  final List<String>? tags;
  final String? brand;
  final String? sku;
  final int? weight;
  final DimensionsDto? dimensions;
  final String? warrantyInformation;
  final String? shippingInformation;
  final String? availabilityStatus;
  final List<ReviewDto>? reviews;
  final String? returnPolicy;
  final int? minimumOrderQuantity;
  final MetaDto? meta;
  final List<String>? images;
  final String? thumbnail;

  ProductDto({
    required this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.images,
    this.thumbnail,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDtoToJson(this);
}
