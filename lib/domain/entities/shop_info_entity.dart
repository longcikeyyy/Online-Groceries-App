import 'package:equatable/equatable.dart';

class ShopInfoEntity extends Equatable{ 
  final int id;
  final String title;
  final String price;
  final String weight;
  final String imageUrl;

  const ShopInfoEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.weight,
    required this.imageUrl,
  });

  @override
  List<Object?> get props =>  [id, title, price, weight, imageUrl];
}