import 'package:equatable/equatable.dart';

class ProductReviewEntity extends Equatable {
  final int rating;
  final String comment;
  final String date;
  final String reviewerName;

  const ProductReviewEntity({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
  });

  @override
  List<Object?> get props => [rating, comment, date, reviewerName];
}

class ProductDetailEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final int weight;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;
  final String returnPolicy;
  final List<String> images;
  final String thumbnail;
  final List<ProductReviewEntity> reviews;

  const ProductDetailEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.weight,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.returnPolicy,
    required this.images,
    required this.thumbnail,
    required this.reviews,
  });

  @override
  List<Object?> get props => [id, title, price, rating];
}
