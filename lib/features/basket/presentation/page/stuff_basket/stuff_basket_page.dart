import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_delivery/constants/constants.dart';
import 'package:malina_delivery/core/utils/app_utils.dart';
import 'package:malina_delivery/core/widgets/basket_item_widget/basket_item_widget.dart';
import 'package:malina_delivery/features/basket/presentation/bloc/stuff_bloc/stuff_bloc.dart';
import 'package:malina_delivery/generated/l10n.dart';

class StuffBasketPage extends StatefulWidget {
  const StuffBasketPage({super.key});

  @override
  State<StuffBasketPage> createState() => _StuffBasketPageState();
}

class _StuffBasketPageState extends State<StuffBasketPage> {
  @override
  void initState() {
    context.read<StuffBloc>().add(const StuffInitialCallEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StuffBloc, StuffState>(
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
                  context.read<StuffBloc>().add(
                        const DeleteAllProductsCallEvent(),
                      );
                },
                child: Text(AppLocalization.current.clean),
              ),
              AppUtils.kBoxWidth20,
            ],
          ),
          body: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: AppUtils.kPaddingHor16,
                sliver: SliverList.separated(
                  itemBuilder: (_, index) => BasketItemWidget(
                    deleteProduct: () {
                      context.read<StuffBloc>().add(DeleteItemCallEvent(
                          productId: state.stuffs?[index].productId ?? ""));
                    },
                    onRemoveProduct: () {
                      context.read<StuffBloc>().add(BasketAddRemoveCallEvent(
                            status: BasketAddRemoveProduct.remove,
                            productId: state.stuffs?[index].productId ?? "",
                          ));
                    },
                    onAddProduct: () {
                      context.read<StuffBloc>().add(BasketAddRemoveCallEvent(
                            status: BasketAddRemoveProduct.add,
                            productId: state.stuffs?[index].productId ?? "",
                          ));
                    },
                    count: state.productCount?[state.stuffs?[index].productId],
                    item: state.stuffs?[index],
                  ),
                  separatorBuilder: (_, __) => AppUtils.kBoxHeight10,
                  itemCount: state.stuffs?.length,
                ),
              ),
              AppUtils.kGap10,
            ],
          ),
        );
      },
    );
  }
}
