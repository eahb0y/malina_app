import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:malina_delivery/core/theme/app_text_styles.dart';
import 'package:malina_delivery/core/theme/colors/app_colors.dart';
import 'package:malina_delivery/core/utils/app_utils.dart';

Widget buildMenuItem({
  required String icon,
  required String text,
  required bool selected,
  required Function(BuildContext context, int index) changeTap,
}) {
  return InkWell(
    borderRadius: AppUtils.kBorderRadius100,
    onTap: () => changeTap,
    child: Column(
      children: [
        SvgPicture.asset(
          "assets/svg/$icon.svg",
          colorFilter: ColorFilter.mode(
            selected ? LightThemeColors.red : LightThemeColors.gray,
            BlendMode.srcIn,
          ),
        ),
        Text(
          text,
          style: selected
              ? AppTextStyles.selectedTab
              : AppTextStyles.unSelectedTab,
          overflow: TextOverflow.ellipsis,
        )
      ],
    ),
  );
}
