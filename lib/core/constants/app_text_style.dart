import 'package:flutter/material.dart';
import 'package:online_groceries_app/core/constants/app_color.dart';

class AppTextStyle {
  /// Regular -> 400
  /// Medium -> 500
  /// Semi-Bold -> 600

  static String fontFamily = 'ReadexPro';

  static TextStyle tsRegular16 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColor.textColor,
  );

  static TextStyle tsSemiBold24 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColor.textColor,
  );

  static TextStyle tsBold16 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColor.textColor,
  );

  static TextStyle tsBold18 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColor.textColor,
  );

  static TextStyle tsRegular14Grey = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColor.greyColor,
  );

  static TextStyle tsSemiBold16Green = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColor.greenColor,
  );
}
