import 'package:flutter/material.dart';
import 'package:online_groceries_app/core/constants/app_color.dart';
import 'package:online_groceries_app/core/constants/app_text_style.dart';
import 'package:online_groceries_app/presentation/screens/product_detail/widgets/product_detail_expandable.dart';
import 'package:online_groceries_app/presentation/screens/product_detail/widgets/product_info_row.dart';

class ProductNutritionSection extends StatelessWidget {
  const ProductNutritionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ProductDetailExpandable(
      title: 'Nutritions',
      content: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductInfoRow('Calories', '52 kcal'),
          SizedBox(height: 4),
          ProductInfoRow('Carbohydrates', '13.8g'),
          SizedBox(height: 4),
          ProductInfoRow('Protein', '0.3g'),
          SizedBox(height: 4),
          ProductInfoRow('Fat', '0.2g'),
          SizedBox(height: 4),
          ProductInfoRow('Fiber', '2.4g'),
        ],
      ),
      trailing: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColor.borderColor,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              '100gr',
              style: AppTextStyle.tsRegular14Grey.copyWith(fontSize: 12),
            ),
          ),
          const SizedBox(width: 8),
          const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: AppColor.textColor,
          ),
        ],
      ),
    );
  }
}
