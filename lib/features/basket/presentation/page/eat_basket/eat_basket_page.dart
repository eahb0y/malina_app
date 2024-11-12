import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_delivery/core/utils/app_utils.dart';
import 'package:malina_delivery/features/basket/presentation/bloc/eat_bloc/eat_bloc.dart';
import 'package:malina_delivery/features/basket/presentation/page/eat_basket/widget/delivery_basket_widget.dart';
import 'package:malina_delivery/features/basket/presentation/page/eat_basket/widget/eat_basket_appBar_widget.dart';
import 'package:malina_delivery/core/widgets/basket_item_widget/basket_item_widget.dart';
import 'package:malina_delivery/features/basket/presentation/page/eat_basket/widget/order_at_basket_widget.dart';
import 'package:malina_delivery/generated/l10n.dart';

class EatBasketPage extends StatefulWidget {
  const EatBasketPage({super.key});

  @override
  State<EatBasketPage> createState() => _EatBasketPageState();
}

class _EatBasketPageState extends State<EatBasketPage> {
  @override
  void initState() {
    context.read<EatBloc>().add(const EatsBasketInitialCall());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EatBloc, EatState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                AppUtils.kBoxWidth16,
                Text(AppLocalization.current.basket),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  context.read<EatBloc>().add(
                        DeleteAllProductsCallEvent(
                          deliveryType: state.isDelivery,
                        ),
                      );
                },
                child: Text(AppLocalization.current.clean),
              ),
              AppUtils.kBoxWidth20,
            ],
            bottom: PreferredSize(
                preferredSize: const Size(double.infinity, 30),
                child: EatBasketAppbarWidget(
                  isDelivery: state.isDelivery,
                )),
          ),
          body: CustomScrollView(
            slivers: [
              AppUtils.kGap10,
              if (state.isDelivery)
                DeliveryBasketWidget(
                  deliveryProducts: state.eatBasketDelivery,
                  productCount: state.productsCount ?? {},
                ),
              if (!state.isDelivery)
                OrderAtBasketWidget(
                  deliveryProducts: state.eatBasketOrderAt,
                  productCount: state.productsCount ?? {},
                ),
              AppUtils.kGap10,
            ],
          ),
        );
      },
    );
  }
}
