import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_delivery/constants/constants.dart';
import 'package:malina_delivery/core/functions/base_functions.dart';
import 'package:malina_delivery/core/mock_data/product_mock_data_entity.dart';
import 'package:malina_delivery/core/utils/app_utils.dart';
import 'package:malina_delivery/features/basket/presentation/bloc/eat_bloc/eat_bloc.dart';
import 'package:malina_delivery/core/widgets/basket_item_widget/basket_item_widget.dart';

class DeliveryBasketWidget extends StatelessWidget {
  final List<ProductMockDataEntity>? deliveryProducts;
  final Map<String, int> productCount;

  const DeliveryBasketWidget({
    super.key,
    required this.deliveryProducts,
    required this.productCount,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: AppUtils.kPaddingHor16,
      sliver: SliverList.separated(
        itemBuilder: (_, index) => BasketItemWidget(
          item: deliveryProducts?[index],
          count: productCount[deliveryProducts?[index].productId],
          onAddProduct: () {
            context.read<EatBloc>().add(BasketAddRemoveCallEvent(
                  productId: deliveryProducts?[index].productId ?? "",
                  orderType: OrderType.delivery,
                  status: BasketAddRemoveProduct.add,
                ));
          },
          onRemoveProduct: () {
            context.read<EatBloc>().add(BasketAddRemoveCallEvent(
                  productId: deliveryProducts?[index].productId ?? "",
                  orderType: OrderType.delivery,
                  status: BasketAddRemoveProduct.remove,
                ));
          },
          deleteProduct: () {
            context.read<EatBloc>().add(DeleteItemCallEvent(
                  productId: deliveryProducts?[index].productId ?? "",
                  orderType: OrderType.delivery,
                ));
          },
        ),
        separatorBuilder: (_, __) => AppUtils.kBoxHeight16,
        itemCount: deliveryProducts?.length,
      ),
    );
  }
}