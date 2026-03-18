import 'package:flutter/material.dart';
import 'package:online_groceries_app/core/constants/app_color.dart';
import 'package:online_groceries_app/core/constants/app_text_style.dart';

class ProductTitleSection extends StatelessWidget {
  final String title;
  final int weight;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;

  const ProductTitleSection({
    super.key,
    required this.title,
    required this.weight,
    required this.isFavorite,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyle.tsSemiBold24),
              const SizedBox(height: 4),
              Text('${weight}kg, Price', style: AppTextStyle.tsRegular14Grey),
            ],
          ),
        ),
        GestureDetector(
          onTap: onFavoriteTap,
          child: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.borderColor),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? AppColor.favoriteActiveColor : AppColor.greyColor,
            ),
          ),
        ),
      ],
    );
  }
}
