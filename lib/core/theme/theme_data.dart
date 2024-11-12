import 'package:flutter/material.dart';
import 'package:malina_delivery/core/utils/app_utils.dart';
import 'app_text_styles.dart';
import 'colors/app_colors.dart';

final appTheme = ThemeData(
  fontFamily: "Montserrat",
  useMaterial3: true,
  applyElevationOverlayColor: true,
  disabledColor: ThemeColors.disabledColor,
  splashColor: ThemeColors.primaryColor.withOpacity(0.01),
  focusColor: ThemeColors.primaryColor,
  colorSchemeSeed: ThemeColors.primaryColor,
  visualDensity: VisualDensity.standard,
  materialTapTargetSize: MaterialTapTargetSize.padded,
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
  // textButtonTheme: TextButtonThemeData(
  //   style: ButtonStyle(
  //     padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
  //       EdgeInsets.zero,
  //     ),
  //   ),
  // ),
  dividerTheme: const DividerThemeData(
    thickness: 1,
  ),
);

final lightTheme = appTheme.copyWith(
  scaffoldBackgroundColor: LightThemeColors.scaffoldBackgroundColor,
  brightness: Brightness.light,
  dividerTheme: appTheme.dividerTheme.copyWith(
    color: LightThemeColors.dividerColor,
  ),
  colorScheme: const ColorScheme.light(
    secondary: ThemeColors.primaryColor,
    primary: ThemeColors.buttonColor,
  ),
  datePickerTheme: const DatePickerThemeData(
    headerBackgroundColor: LightThemeColors.grayButton,
    headerForegroundColor: LightThemeColors.white,
    shape: RoundedRectangleBorder(
      borderRadius: AppUtils.kBorderRadius2,
    ),
    rangePickerHeaderBackgroundColor: LightThemeColors.grayButton,
  ),
  listTileTheme: const ListTileThemeData(
    minVerticalPadding: 14,
    minLeadingWidth: 16,
    horizontalTitleGap: 12,
    tileColor: LightThemeColors.white,
    selectedColor: LightThemeColors.backgroundColor,
    selectedTileColor: LightThemeColors.backgroundColor,
    shape: RoundedRectangleBorder(
      borderRadius: AppUtils.kBorderRadius10,
    ),
  ),
  tabBarTheme: const TabBarTheme(
    labelColor: ThemeColors.primaryColor,
    unselectedLabelColor: LightThemeColors.unselectedItemColor,
    labelPadding: EdgeInsets.zero,
    labelStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
    unselectedLabelStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(color: ThemeColors.primaryColor, width: 2.0),
    ),
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 1,
    foregroundColor: LightThemeColors.scaffoldBackgroundColor,
    backgroundColor: LightThemeColors.scaffoldBackgroundColor,
    surfaceTintColor: LightThemeColors.scaffoldBackgroundColor,
    shadowColor: Colors.black,
    // shape: ContinuousRectangleBorder(
    //   borderRadius: BorderRadius.only(
    //     bottomLeft: Radius.circular(24),
    //     bottomRight: Radius.circular(24),
    //   ),
    // ),
    titleTextStyle: AppTextStyles.appBarTitle,
    toolbarHeight: 56,
    iconTheme: IconThemeData(color: ThemeColors.white),
    titleSpacing: 0,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    alignLabelWithHint: true,
    contentPadding: AppUtils.kPaddingVer16Hor14,
    // labelStyle: AppTextStyles.hintTextStyle,
    // floatingLabelStyle: AppTextStyles.hintTextStyle,
    // helperStyle: AppTextStyles.hintTextStyle,
    // hintStyle: AppTextStyles.hintTextStyle,
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
      borderSide: BorderSide(color: ThemeColors.red),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
      borderSide: BorderSide(color: LightThemeColors.textFieldBorderColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
      borderSide: BorderSide(color: LightThemeColors.textFieldBorderColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
      borderSide: BorderSide(
        color: ThemeColors.primaryColor,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
      borderSide: BorderSide(color: LightThemeColors.textFieldBorderColor),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
      borderSide: BorderSide(color: ThemeColors.red),
    ),
    filled: true,
    isDense: true,
    // prefixStyle: AppTextStyles.textField,
    fillColor: LightThemeColors.white,
    floatingLabelAlignment: FloatingLabelAlignment.start,
    // floatingLabelBehavior: FloatingLabelBehavior.always,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      overlayColor: WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.hovered)) {
            return ThemeColors.buttonColor;
          }
          return null;
        },
      ),
      elevation: WidgetStateProperty.all<double>(0),
      textStyle: WidgetStateProperty.all<TextStyle>(
        const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: ThemeColors.white,
        ),
      ),
      foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.disabled)) {
          return LightThemeColors.white;
        } else {
          return LightThemeColors.white;
        }
      }),
      backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.disabled)) {
          return ThemeColors.disabledColor;
        } else {
          return ThemeColors.buttonColor;
        }
      }),
      maximumSize: WidgetStateProperty.all<Size>(
        const Size(double.infinity, 56),
      ),
      minimumSize: WidgetStateProperty.all<Size>(
        const Size(double.infinity, 56),
      ),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: LightThemeColors.backgroundColor,
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: true,
    selectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
    unselectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
    unselectedItemColor: LightThemeColors.unselectedItemColor,
    selectedItemColor: LightThemeColors.selectedItemColor,
    selectedIconTheme: IconThemeData(size: 25),
    unselectedIconTheme: IconThemeData(size: 25),
    elevation: 2,
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 4, vertical: 2)),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      elevation: WidgetStateProperty.all<double>(2),
      foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        return LightThemeColors.dialogText;
      }),
      backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.disabled)) {
          return Colors.transparent;
        } else {
          return Colors.transparent;
        }
      }),
      maximumSize: WidgetStateProperty.all<Size>(
        const Size(double.infinity, double.infinity),
      ),
      minimumSize: WidgetStateProperty.all<Size>(
        const Size(double.minPositive, double.minPositive),
      ),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
      ),
      textStyle: WidgetStateProperty.all<TextStyle>(
        const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: ThemeColors.black,
        ),
      ),
    ),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.transparent,
    // surfaceTintColor: Colors.transparent,
    modalBackgroundColor: Colors.transparent,
    modalElevation: 0,
    elevation: 0,
  ),
);
