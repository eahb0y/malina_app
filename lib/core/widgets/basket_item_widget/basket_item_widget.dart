import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:malina_delivery/core/functions/base_functions.dart';
import 'package:malina_delivery/core/mock_data/product_mock_data_entity.dart';
import 'package:malina_delivery/core/theme/app_text_styles.dart';
import 'package:malina_delivery/core/theme/colors/app_colors.dart';
import 'package:malina_delivery/core/utils/app_utils.dart';
import 'package:malina_delivery/core/widgets/cached_network_image/custom_cached_network_image.dart';
import 'package:malina_delivery/features/basket/presentation/page/eat_basket/widget/basket_add_remove_button_widget.dart';
import 'package:malina_delivery/generated/l10n.dart';

class BasketItemWidget extends StatelessWidget {
  final ProductMockDataEntity? item;
  final int? count;
  final Function() onAddProduct;
  final Function() onRemoveProduct;
  final Function() deleteProduct;

  const BasketItemWidget({
    super.key,
    required this.item,
    required this.count,
    required this.onAddProduct,
    required this.onRemoveProduct,
    required this.deleteProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: LightThemeColors.white,
        borderRadius: AppUtils.kBorderRadius20,
      ),
      padding: AppUtils.kPaddingLRB20T12,
      child: Column(
        children: [
          const Row(
            children: [
              Text("Bellagio Coffee"),
              Icon(Icons.navigate_next_outlined)
            ],
          ),
          AppUtils.kDivider,
          AppUtils.kBoxHeight12,
          Row(
            children: [
              CustomCachedNetworkImage(
                imageUrl: item?.image ?? "",
                width: 110,
                height: 110,
              ),
              AppUtils.kBoxWidth10,
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(item?.name ?? ""),
                        Text(AppLocalization.current.som(item?.price ?? "")),
                      ],
                    ),
                    AppUtils.kBoxHeight4,
                    Text(
                      item?.name ?? "",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      // style: AppTextStyles.flightPreferences,
                    ),
                    AppUtils.kBoxHeight24,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            BasketAddRemoveButtonWidget(
                              icon: Icons.remove,
                              onTab: onRemoveProduct,
                            ),
                            AppUtils.kBoxWidth14,
                            Text(
                              count.toString(),
                              style: AppTextStyles.itemCount,
                            ),
                            AppUtils.kBoxWidth14,
                            BasketAddRemoveButtonWidget(
                                icon: Icons.add, onTab: onAddProduct),
                          ],
                        ),
                        InkWell(
                          borderRadius: AppUtils.kBorderRadius20,
                          onTap: deleteProduct,
                          child: SvgPicture.asset("assets/svg/ic_delete.svg"),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          AppUtils.kBoxHeight16,
          Material(
            color: Colors.transparent,
            child: ListTile(
              onTap: () {},
              tileColor: LightThemeColors.imageBg,
              shape: const RoundedRectangleBorder(
                borderRadius: AppUtils.kBorderRadius12,
              ),
              leading: SvgPicture.asset("assets/svg/ic_add_green.svg"),
              title: Text(
                AppLocalization.current.add,
              ),
            ),
          ),
          AppUtils.kBoxHeight20,
          ElevatedButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppLocalization.current.order),
                Text(
                  Functions.moneyFormat(item?.price ?? 0),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
