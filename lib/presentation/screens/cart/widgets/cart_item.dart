import 'package:flutter/material.dart';
import 'package:online_groceries_app/core/constants/app_color.dart';
import 'package:online_groceries_app/domain/entities/favorite_product_entity.dart';
import 'package:online_groceries_app/presentation/screens/cart/widgets/quantity_button.dart';

class CartItem extends StatefulWidget {
  final FavoriteProductEntity product;

  const CartItem({super.key, required this.product});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.product.quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Product Image
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            widget.product.thumbnail,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) {
              return Container(
                width: 80,
                height: 80,
                color: Colors.grey[300],
                child: const Icon(Icons.image_not_supported),
              );
            },
          ),
        ),
        const SizedBox(width: 16),
        // Product Info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.product.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: AppColor.blackColor,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // TODO: Remove item from cart
                    },
                    child: const Icon(
                      Icons.close,
                      color: Color(0xFF7C7C7C),
                      size: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                '1kg, Price',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Quantity Controls
                  Row(
                    children: [
                      QuantityButton(
                        icon: Icons.remove,
                        onTap: () {
                          if (quantity > 1) {
                            setState(() => quantity--);
                          }
                        },
                      ),
                      const SizedBox(width: 12),
                      Text(
                        '$quantity',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColor.blackColor,
                        ),
                      ),
                      const SizedBox(width: 12),
                      QuantityButton(
                        icon: Icons.add,
                        onTap: () {
                          setState(() => quantity++);
                        },
                      ),
                    ],
                  ),
                  // Price
                  Text(
                    '\$${widget.product.discountedTotal.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColor.blackColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
