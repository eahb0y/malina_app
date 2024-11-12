import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_delivery/constants/constants.dart';
import 'package:malina_delivery/core/local_source/local_source.dart';
import 'package:malina_delivery/core/mock_data/product_mock_data.dart';
import 'package:malina_delivery/core/mock_data/product_mock_data_entity.dart';
import 'package:malina_delivery/core/product_model/product_model.dart';
import 'package:malina_delivery/injector_container.dart';

part 'stuff_event.dart';

part 'stuff_state.dart';

class StuffBloc extends Bloc<StuffEvent, StuffState> {
  StuffBloc() : super(StuffState.initialValue()) {
    on<StuffInitialCallEvent>(_initialCall);
    on<DeleteAllProductsCallEvent>(_deleteAllProduct);
    on<BasketAddRemoveCallEvent>(_removeAddProductCall);
    on<DeleteItemCallEvent>(_deleteItemCall);
  }

  Future<void> _initialCall(
      StuffInitialCallEvent event, Emitter<StuffState> emit) async {
    final List<ProductMockDataEntity> stuff = [];
    final Map<String, int> productCount = {};
    emit(state.copyWith(isLoading: true));
    final result = await sl<LocalSource>().getAllEvents();
    for (final item in result) {
      productCount[item.productId] = item.productCount;
      if (item.productType == ProductType.stuff) {
        for (final product in ProductMockData.productsList) {
          if (product.productId == item.productId) {
            stuff.add(product);
          }
        }
      }
    }
    emit(
      state.copyWith(
        isLoading: false,
        stuffs: [...stuff],
        productCount: productCount,
      ),
    );
  }

  Future<void> _deleteAllProduct(
      DeleteAllProductsCallEvent event, Emitter<StuffState> emit) async {
    emit(state.copyWith(isLoading: true));
    sl<LocalSource>().deleteProductByTypeAndOrder(
      ProductType.stuff,
      "",
    );
    if ((state.stuffs?.isNotEmpty ?? false)) {
      emit(state.copyWith(
        isLoading: false,
        stuffs: [],
      ));
    }
  }

  Future<void> _removeAddProductCall(
      BasketAddRemoveCallEvent event, Emitter<StuffState> emit) async {
    emit(state.copyWith(isLoading: true));
    final List<ProductMockDataEntity>? stuffs = state.stuffs;
    final response = await sl<LocalSource>().getEventById(event.productId);
    final Map<String, int>? productCount = state.productCount;
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
        (state.productCount?[event.productId] ?? 0) == 1) {
      await sl<LocalSource>().deleteEventById(event.productId);
      stuffs?.removeWhere((item) => item.productId == event.productId);
    }
    emit(state.copyWith(
      isLoading: false,
      stuffs: [...?stuffs],
      productCount: {}..addAll(Map.of(productCount ?? {})),
    ));
  }

  Future<void> _deleteItemCall(
      DeleteItemCallEvent event, Emitter<StuffState> emit) async {
    emit(state.copyWith(isLoading: true));
    final List<ProductMockDataEntity>? stuffs = state.stuffs;
    sl<LocalSource>().deleteEventById(event.productId);
    await sl<LocalSource>().deleteEventById(event.productId);
    stuffs?.removeWhere((item) => item.productId == event.productId);
    emit(state.copyWith(
      isLoading: false,
      stuffs: [...?stuffs],
    ));
  }
}
