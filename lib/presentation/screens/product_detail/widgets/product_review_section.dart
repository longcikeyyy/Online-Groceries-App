import 'package:flutter/material.dart';
import 'package:online_groceries_app/core/constants/app_color.dart';
import 'package:online_groceries_app/core/constants/app_text_style.dart';
import 'package:online_groceries_app/domain/entities/product_detail_entity.dart';
import 'package:online_groceries_app/presentation/screens/product_detail/widgets/product_detail_expandable.dart';

class ProductReviewSection extends StatelessWidget {
  final List<ProductReviewEntity> reviews;
  final double rating;

  const ProductReviewSection({
    super.key,
    required this.reviews,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return ProductDetailExpandable(
      title: 'Review',
      content: Column(
        children: reviews
            .map((r) => _ReviewItem(review: r))
            .toList(),
      ),
      trailing: Row(
        children: [
          ...List.generate(
            5,
            (i) => Icon(
              Icons.star,
              size: 16,
              color: i < rating.round()
                  ? AppColor.starActiveColor
                  : AppColor.borderColor,
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

class _ReviewItem extends StatelessWidget {
  final ProductReviewEntity review;

  const _ReviewItem({required this.review});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                review.reviewerName,
                style: AppTextStyle.tsBold16.copyWith(fontSize: 14),
              ),
              const Spacer(),
              ...List.generate(
                5,
                (i) => Icon(
                  Icons.star,
                  size: 14,
                  color: i < review.rating
                      ? AppColor.starActiveColor
                      : AppColor.borderColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(review.comment, style: AppTextStyle.tsRegular14Grey),
        ],
      ),
    );
  }
}
