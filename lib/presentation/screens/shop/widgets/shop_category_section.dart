import 'package:flutter/material.dart';
import 'package:online_groceries_app/core/constants/app_text_style.dart';
import 'package:online_groceries_app/domain/entities/shop_info_entity.dart';
import 'package:online_groceries_app/presentation/screens/shop/widgets/shop_product_card.dart';

class ShopCategorySection extends StatelessWidget {
  final String categoryName;
  final List<ShopInfoEntity> items;

  const ShopCategorySection({
    super.key,
    required this.categoryName,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(categoryName, style: AppTextStyle.tsSemiBold24),
                TextButton(
                  onPressed: () {},
                  child: Text('See all', style: AppTextStyle.tsSemiBold16Green),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 249,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: items.length,
              itemBuilder: (context, index) =>
                  ShopProductCard(item: items[index]),
            ),
          ),
        ],
      ),
    );
  }
}
