import 'package:flutter/material.dart';
import 'package:malina_delivery/core/theme/colors/app_colors.dart';
import 'package:malina_delivery/core/utils/app_utils.dart';

class BasketAddRemoveButtonWidget extends StatelessWidget {
  final IconData icon;
  final Function() onTab;

  const BasketAddRemoveButtonWidget({
    super.key,
    required this.icon,
    required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: AppUtils.kBorderRadius10,
      onTap: onTab,
      child: Container(
        // height: 34,
        // width: 34,
        padding: AppUtils.kPaddingAll10,
        decoration: const BoxDecoration(
          borderRadius: AppUtils.kBorderRadius10,
          color: LightThemeColors.imageBg,
        ),
        child: Center(
          child: Icon(icon),
        ),
      ),
    );
  }
}
