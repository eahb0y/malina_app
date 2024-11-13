import 'package:flutter/material.dart';

class ThemeColors {
  static const white = Color(0xFFffffff);
  static const black = Color(0xFF000000);
  static const grey = Color(0xFF969696);
  static const primaryColor = Color(0xFF0B2B5E);
  static const red = Color(0xFFF72055);
  static const buttonColor = Color(0xFFF72055);
  static const disabledColor = Color(0x4D0B2B5E);
}

class LightThemeColors extends ThemeColors {
  static const white = Color(0xFFffffff);
  static const whiteBackground = Color(0xFFffffff);
  static const backgroundColor = Color(0xFFFFFFFF);
  static const scaffoldBackgroundColor = Color(0xFFFAFAFB);
  static final dividerColor = const Color(0xFF000000).withOpacity(0.05);
  static const unselectedItemColor = Color(0xFF9DAABF);
  static const selectedItemColor = Color(0xFF0B2B5E);
  static const textFieldBackGround = Color(0xFFF3F4F4);
  static const red = Color(0xFFF72055);
  static const dialogText = Color(0xFF1D242F);
  static const textFieldBorderColor = Color(0xffD0D5DD);
  static const borderColor = Color(0x1F000000);
  static const borderLight = Color(0x0a000000);
  static const grayButton = Color(0xFF606875);
  static const appBarColor = Color(0xFF3D4655);
  static const settingBorderColor = Color(0xFFB2B2B2);
  static const textFieldSuffixBorder = Color(0xFFEAEAEA);
  static const itemCategoryBorder = Color(0xFFA0A09C);
  static const gray = Color(0xFF8D8D8D);
  static const grayTab = Color(0xFFF5F5F6);
  static const blackTab = Color(0xFF1D1D1D);
  static const eatBasketTitleColor = Color(0xFF353535);
  static const eatBasketTitleBorderColor = Color(0xFFEDEBEB);
  static const imageBg = Color(0xFFF8F8F8);
  static const categoryNameColor = Color(0xFF5F5F5F);
  static const itemDescColor = Color(0xFF777777);
}

class DarkThemeColors extends ThemeColors {
  static const backgroundColor = Color(0xFF000000);
  static const scaffoldBackgroundColor = Color(0xFF090806);
  static const textColor = Color(0xFFFFFFFF);
  static final dividerColor = const Color(0xFFFFFFFF).withOpacity(0.05);
}
