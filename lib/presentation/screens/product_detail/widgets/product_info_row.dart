import 'package:flutter/material.dart';
import 'package:online_groceries_app/core/constants/app_text_style.dart';

class ProductInfoRow extends StatelessWidget {
  final String label;
  final String value;

  const ProductInfoRow(this.label, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Text(label, style: AppTextStyle.tsRegular14Grey),
        ),
        Expanded(
          child: Text(
            value,
            style: AppTextStyle.tsBold16.copyWith(fontSize: 14),
          ),
        ),
      ],
    );
  }
}
