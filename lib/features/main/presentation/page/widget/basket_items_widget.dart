import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:malina_delivery/core/theme/app_text_styles.dart';
import 'package:malina_delivery/core/theme/colors/app_colors.dart';
import 'package:malina_delivery/core/utils/app_utils.dart';

Widget buildBasketItem({
  required String icon,
  required String text,
  required Function(BuildContext context, int index) changeTap,
}) {
  return InkWell(
    borderRadius: AppUtils.kBorderRadius100,
    onTap: () => changeTap,
    child: Ink(
      height: 60,
      width: 60,
      padding: AppUtils.kPaddingAll12,
      decoration: const BoxDecoration(
          color: LightThemeColors.grayTab,
          borderRadius: AppUtils.kBorderRadius100),
      child: Column(
        children: [
          SvgPicture.asset(
            "assets/svg/$icon.svg",
            colorFilter: const ColorFilter.mode(
              LightThemeColors.gray,
              BlendMode.srcIn,
            ),
          ),
          Text(
            text,
            style: AppTextStyles.basketCategory,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    ),
  );
}
