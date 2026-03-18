import 'package:flutter/material.dart';
import 'package:online_groceries_app/core/constants/app_color.dart';
import 'package:online_groceries_app/core/constants/app_text_style.dart';

class ProductAddToBasketButton extends StatelessWidget {
  final VoidCallback onTap;

  const ProductAddToBasketButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            height: 56,
            decoration: BoxDecoration(
              color: AppColor.greenColor,
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.center,
            child: Text(
              'Add To Basket',
              style: AppTextStyle.tsBold16.copyWith(color: AppColor.whiteColor),
            ),
          ),
        ),
      ),
    );
  }
}
