import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_groceries_app/core/constants/app_color.dart';
import 'package:online_groceries_app/core/constants/app_text_style.dart';
import 'package:online_groceries_app/domain/entities/shop_info_entity.dart';
import 'package:online_groceries_app/presentation/routes/route_name.dart';
import 'package:online_groceries_app/presentation/screens/shop/widgets/shop_add_button.dart';

class ShopProductCard extends StatelessWidget {
  final ShopInfoEntity item;

  const ShopProductCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        RouteName.productDetailName,
        pathParameters: {'id': item.id.toString()},
      ),
      child: Container(
        width: 174,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          border: Border.all(color: AppColor.borderColor),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: AppColor.blackColor.withValues(alpha: 0.05),
              spreadRadius: 0,
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: Image.network(
                    item.imageUrl,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) =>
                        const Icon(Icons.image_not_supported, size: 60),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                item.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.tsBold16,
              ),
              const SizedBox(height: 2),
              Text(
                '${item.weight}, Price',
                style: AppTextStyle.tsRegular14Grey,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$${item.price}', style: AppTextStyle.tsBold18),
                  ShopAddButton(onTap: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
