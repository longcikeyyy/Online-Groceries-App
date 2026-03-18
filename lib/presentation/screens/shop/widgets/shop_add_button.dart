import 'package:flutter/material.dart';
import 'package:online_groceries_app/core/constants/app_color.dart';

class ShopAddButton extends StatelessWidget {
  final VoidCallback onTap;

  const ShopAddButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: AppColor.greenColor,
          borderRadius: BorderRadius.circular(17),
        ),
        child: const Icon(
          Icons.add,
          color: AppColor.whiteColor,
          size: 26,
        ),
      ),
    );
  }
}
