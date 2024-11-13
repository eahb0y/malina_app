import 'package:flutter/material.dart';

import 'colors/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const flightPreferences = TextStyle(
    color: Colors.black,
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );

  static const appBarTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: LightThemeColors.blackTab,
  );
  static const unSelectedTab = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: LightThemeColors.gray,
  );
  static const selectedTab = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: LightThemeColors.red,
  );
  static const qrTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: LightThemeColors.white,
  );
  static const basketCategory = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: LightThemeColors.blackTab,
  );
  static const basketCategoryTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: LightThemeColors.eatBasketTitleColor,
  );
  static const elevatedButton = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: LightThemeColors.white,
  );
  static const itemCount = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: LightThemeColors.blackTab,
  );
  static const categoryName = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: LightThemeColors.categoryNameColor,
  );
  static const productName = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: LightThemeColors.blackTab,
  );
  static const productDesc = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: LightThemeColors.itemDescColor,
  );
}
