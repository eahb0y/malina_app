import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_delivery/core/theme/app_text_styles.dart';
import 'package:malina_delivery/core/theme/colors/app_colors.dart';
import 'package:malina_delivery/core/utils/app_utils.dart';
import 'package:malina_delivery/features/basket/presentation/bloc/eat_bloc/eat_bloc.dart';
import 'package:malina_delivery/generated/l10n.dart';

class EatBasketAppbarWidget extends StatelessWidget {
  final bool isDelivery;

  const EatBasketAppbarWidget({
    super.key,
    required this.isDelivery,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppUtils.kPaddingHor16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SizedBox(
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: AppUtils.kBorderRadius20,
                    side: BorderSide(
                      color: LightThemeColors.eatBasketTitleBorderColor,
                    ),
                  ),
                  backgroundColor: isDelivery
                      ? LightThemeColors.red
                      : LightThemeColors.white,
                ),
                onPressed: () {
                  context
                      .read<EatBloc>()
                      .add(const ChangeBasketTabCallEvent(value: true));
                },
                child: Text(
                  AppLocalization.current.order,
                  style: isDelivery
                      ? AppTextStyles.elevatedButton
                      : AppTextStyles.basketCategoryTitle,
                ),
              ),
            ),
          ),
          AppUtils.kBoxWidth16,
          Expanded(
            child: SizedBox(
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: AppUtils.kBorderRadius20,
                    side: BorderSide(
                      color: LightThemeColors.eatBasketTitleBorderColor,
                    ),
                  ),
                  backgroundColor: !isDelivery
                      ? LightThemeColors.red
                      : LightThemeColors.white,
                ),
                onPressed: () {
                  context
                      .read<EatBloc>()
                      .add(const ChangeBasketTabCallEvent(value: false));
                },
                child: Text(
                  AppLocalization.current.order_at,
                  style: !isDelivery
                      ? AppTextStyles.elevatedButton
                      : AppTextStyles.basketCategoryTitle,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
