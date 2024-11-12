part of 'eat_bloc.dart';

sealed class EatEvent extends Equatable {
  const EatEvent();
}

final class ChangeBasketTabCallEvent extends EatEvent {
  final bool value;

  const ChangeBasketTabCallEvent({
    required this.value,
  });

  @override
  List<Object?> get props => [value];
}

final class DeleteAllEatFromBasketCallEvent extends EatEvent {
  const DeleteAllEatFromBasketCallEvent();

  @override
  List<Object?> get props => [];
}

final class EatsBasketInitialCall extends EatEvent {
  const EatsBasketInitialCall();

  @override
  List<Object?> get props => [];
}

final class DeleteAllProductsCallEvent extends EatEvent {
  final bool deliveryType;

  const DeleteAllProductsCallEvent({
    required this.deliveryType,
  });

  @override
  List<Object?> get props => [deliveryType];
}

final class BasketAddRemoveCallEvent extends EatEvent {
  final String productId;
  final BasketAddRemoveProduct status;
  final String orderType;

  const BasketAddRemoveCallEvent({
    required this.status,
    required this.productId,
    required this.orderType,
  });

  @override
  List<Object?> get props => [
        status,
        productId,
        orderType,
      ];
}

final class DeleteItemCallEvent extends EatEvent {
  final String productId;
  final String orderType;

  const DeleteItemCallEvent({
    required this.productId,
    required this.orderType,
  });

  @override
  List<Object?> get props => [
        productId,
        orderType,
      ];
}
