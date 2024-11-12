import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_delivery/constants/constants.dart';
import 'package:malina_delivery/core/local_source/local_source.dart';
import 'package:malina_delivery/core/mock_data/product_mock_data.dart';
import 'package:malina_delivery/core/mock_data/product_mock_data_entity.dart';
import 'package:malina_delivery/core/product_model/product_model.dart';
import 'package:malina_delivery/injector_container.dart';

part 'eat_event.dart';

part 'eat_state.dart';

class EatBloc extends Bloc<EatEvent, EatState> {
  EatBloc() : super(EatState.initialValue()) {
    on<ChangeBasketTabCallEvent>(_changeTabCall);
    on<DeleteAllEatFromBasketCallEvent>(_deleteAllEatsFromBasketAll);
    on<EatsBasketInitialCall>(_eatBasketInitialCall);
    on<DeleteAllProductsCallEvent>(_deleteDeliveryOrdersCall);
    on<BasketAddRemoveCallEvent>(_basketAddRemoveCall);
    on<DeleteItemCallEvent>(_deleteProduct);
  }

  void _changeTabCall(ChangeBasketTabCallEvent event, Emitter<EatState> emit) {
    emit(state.copyWith(isDelivery: event.value));
  }

  Future<void> _deleteAllEatsFromBasketAll(
      DeleteAllEatFromBasketCallEvent event, Emitter<EatState> emit) async {
    emit(state.copyWith(isLoading: true));
    if (state.isDelivery) {
      await sl<LocalSource>()
          .deleteProductByTypeAndOrder(ProductType.food, OrderType.delivery);
    } else {
      await sl<LocalSource>()
          .deleteProductByTypeAndOrder(ProductType.food, OrderType.delivery);
    }
    emit(state.copyWith(isLoading: false));
  }

  Future<void> _eatBasketInitialCall(
      EatsBasketInitialCall event, Emitter<EatState> emit) async {
    final List<ProductMockDataEntity> eatBasketDelivery = [];
    final List<ProductMockDataEntity> eatBasketOrderAt = [];
    final Map<String, int> productCount = {};
    emit(state.copyWith(isLoading: true));
    final result = await sl<LocalSource>().getAllEvents();
    for (final item in result) {
      productCount[item.productId] = item.productCount;
      if (item.orderType == OrderType.delivery) {
        for (final product in ProductMockData.productsList) {
          if (product.productId == item.productId) {
            eatBasketDelivery.add(product);
          }
        }
      }
      if (item.orderType == OrderType.orderAt) {
        for (final product in ProductMockData.productsList) {
          if (product.productId == item.productId) {
            eatBasketOrderAt.add(product);
          }
        }
      }
    }
    emit(
      state.copyWith(
        isLoading: false,
        eatBasketDelivery: [...eatBasketDelivery],
        eatBasketOrderAt: [...eatBasketOrderAt],
        productsCount: productCount,
      ),
    );
  }

  Future<void> _deleteDeliveryOrdersCall(
      DeleteAllProductsCallEvent event, Emitter<EatState> emit) async {
    emit(state.copyWith(isLoading: true));
    sl<LocalSource>().deleteProductByTypeAndOrder(
      ProductType.food,
      state.isDelivery ? OrderType.delivery : OrderType.orderAt,
    );
    if (state.isDelivery && (state.eatBasketDelivery?.isNotEmpty ?? false)) {
      emit(state.copyWith(
        isLoading: false,
        eatBasketDelivery: state.isDelivery ? [] : state.eatBasketDelivery,
      ));
    }
    if (!state.isDelivery && (state.eatBasketOrderAt?.isNotEmpty ?? false)) {
      emit(state.copyWith(
        isLoading: false,
        eatBasketOrderAt: !state.isDelivery ? [] : state.eatBasketOrderAt,
      ));
    }
  }

  Future<void> _basketAddRemoveCall(
      BasketAddRemoveCallEvent event, Emitter<EatState> emit) async {
    emit(state.copyWith(isLoading: true));
    final List<ProductMockDataEntity>? eatBasketDelivery =
        state.eatBasketDelivery;
    final List<ProductMockDataEntity>? eatBasketOrderAt =
        state.eatBasketOrderAt;
    final response = await sl<LocalSource>().getEventById(event.productId);
    final Map<String, int>? productCount = state.productsCount;
    if (event.status == BasketAddRemoveProduct.add) {
      await sl<LocalSource>().updateEvent(
        Product(
          productId: response?.productId ?? "",
          productName: response?.productName ?? "",
          productCount: (response?.productCount ?? 0) + 1,
          inBasket: response?.inBasket ?? false,
          orderType: response?.orderType ?? OrderType.delivery,
          productType: response?.productType ?? ProductType.food,
          id: response?.id,
        ),
      );
      productCount?[event.productId] = (productCount[event.productId] ?? 0) + 1;
    } else if (event.status == BasketAddRemoveProduct.remove &&
        (response?.productCount ?? 0) > 1) {
      await sl<LocalSource>().updateEvent(
        Product(
          productId: response?.productId ?? "",
          productName: response?.productName ?? "",
          productCount: (response?.productCount ?? 0) - 1,
          inBasket: response?.inBasket ?? false,
          orderType: response?.orderType ?? OrderType.delivery,
          productType: response?.productType ?? ProductType.food,
          id: response?.id,
        ),
      );
      productCount?[event.productId] = (productCount[event.productId] ?? 0) - 1;
    } else if (event.status == BasketAddRemoveProduct.remove &&
        (state.productsCount?[event.productId] ?? 0) == 1) {
      await sl<LocalSource>().deleteEventById(event.productId);
      if (event.orderType == OrderType.delivery) {
        eatBasketDelivery
            ?.removeWhere((item) => item.productId == event.productId);
      } else {
        eatBasketOrderAt
            ?.removeWhere((item) => item.productId == event.productId);
      }
    }
    emit(state.copyWith(
      isLoading: false,
      eatBasketOrderAt: [...?eatBasketOrderAt],
      eatBasketDelivery: [...?eatBasketDelivery],
      productsCount: {}..addAll(Map.of(productCount ?? {})),
    ));
  }

  Future<void> _deleteProduct(
      DeleteItemCallEvent event, Emitter<EatState> emit) async {
    emit(state.copyWith(isLoading: true));
    final List<ProductMockDataEntity>? eatBasketDelivery =
        state.eatBasketDelivery;
    final List<ProductMockDataEntity>? eatBasketOrderAt =
        state.eatBasketOrderAt;
    sl<LocalSource>().deleteEventById(event.productId);
    await sl<LocalSource>().deleteEventById(event.productId);
    if (event.orderType == OrderType.delivery) {
      eatBasketDelivery
          ?.removeWhere((item) => item.productId == event.productId);
    } else {
      eatBasketOrderAt
          ?.removeWhere((item) => item.productId == event.productId);
    }
    emit(state.copyWith(
      isLoading: false,
      eatBasketOrderAt: [...?eatBasketOrderAt],
      eatBasketDelivery: [...?eatBasketDelivery],
    ));
  }
}
