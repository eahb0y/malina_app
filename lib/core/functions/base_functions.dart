import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:malina_delivery/core/mock_data/product_mock_data_entity.dart';
import 'package:malina_delivery/core/theme/app_text_styles.dart';
import 'package:malina_delivery/core/theme/colors/app_colors.dart';
import 'package:malina_delivery/core/utils/app_utils.dart';
import 'package:malina_delivery/generated/l10n.dart';
import 'package:malina_delivery/route/app_routes.dart';

class Functions {
  static String moneyFormat(num number) {
    String splitter = " ";
    final isNegative = number.isNegative;
    number = number.abs();
    String result = "0";
    result =
        NumberFormat("#,##0", "ru_RU").format(number).split(",").join(splitter);
    return isNegative
        ? "-$result ${AppLocalization.current.sum}"
        : "$result ${AppLocalization.current.sum}";
  }

  static void showAlertSnackBar(String text) {
    ScaffoldMessenger.of(rootNavigatorKey.currentContext!).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        padding: EdgeInsets.zero,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        content: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: AppUtils.kBorderRadius24,
          ),
          color: LightThemeColors.white,
          child: Padding(
            padding: AppUtils.kPaddingVer10Hor16,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    text,
                    style: AppTextStyles.selectedTab,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
