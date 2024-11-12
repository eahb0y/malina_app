import 'package:flutter/material.dart';
import 'package:malina_delivery/constants/constants.dart';
import 'package:malina_delivery/core/theme/app_text_styles.dart';
import 'package:malina_delivery/core/utils/app_utils.dart';
import 'package:malina_delivery/generated/l10n.dart';
import 'package:malina_delivery/route/app_routes.dart';

class QrScanFoodDialog extends StatelessWidget {
  const QrScanFoodDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: AppUtils.kBorderRadius24,
      ),
      child: Padding(
        padding: AppUtils.kPaddingAll16,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppUtils.kBoxHeight16,
            const Text(
              "Выберите тип заказа",
              style: AppTextStyles.selectedTab,
              textAlign: TextAlign.center,
            ),
            AppUtils.kBoxHeight30,
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(
                          rootNavigatorKey.currentContext!, OrderType.delivery);
                    },
                    child: Text(AppLocalization.current.delivery),
                  ),
                ),
                AppUtils.kBoxWidth10,
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(
                          rootNavigatorKey.currentContext!, OrderType.orderAt);
                    },
                    child: FittedBox(
                      child: Text(AppLocalization.current.order_at),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
