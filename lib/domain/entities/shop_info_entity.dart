import 'package:equatable/equatable.dart';

class ShopInfoEntity extends Equatable {
  final int id;
  final String title;
  final String price;
  final String weight;
  final String imageUrl;
  final String category;

  const ShopInfoEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.weight,
    required this.imageUrl,
    required this.category,
  });

  @override
  List<Object?> get props => [id, title, price, weight, imageUrl];
}
