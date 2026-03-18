import 'package:flutter/material.dart';
import 'package:online_groceries_app/core/constants/app_color.dart';
import 'package:online_groceries_app/core/constants/app_text_style.dart';

class ProductDetailExpandable extends StatefulWidget {
  final String title;
  final Widget content;
  final Widget? trailing;
  final bool initiallyExpanded;

  const ProductDetailExpandable({
    super.key,
    required this.title,
    required this.content,
    this.trailing,
    this.initiallyExpanded = false,
  });

  @override
  State<ProductDetailExpandable> createState() =>
      _ProductDetailExpandableState();
}

class _ProductDetailExpandableState extends State<ProductDetailExpandable> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(height: 1, color: AppColor.borderColor),
        InkWell(
          onTap: widget.trailing == null
              ? () => setState(() => _isExpanded = !_isExpanded)
              : null,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.title, style: AppTextStyle.tsBold16),
                widget.trailing ??
                    Icon(
                      _isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: AppColor.textColor,
                    ),
              ],
            ),
          ),
        ),
        if (_isExpanded) ...[
          widget.content,
          const SizedBox(height: 16),
        ],
      ],
    );
  }
}
