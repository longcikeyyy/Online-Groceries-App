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

  

}
