part of 'stuff_bloc.dart';

sealed class StuffEvent extends Equatable {
  const StuffEvent();
}

final class StuffInitialCallEvent extends StuffEvent {
  const StuffInitialCallEvent();

  @override
  List<Object?> get props => [];
}

final class DeleteAllProductsCallEvent extends StuffEvent {
  const DeleteAllProductsCallEvent();

  @override
  List<Object?> get props => [];
}

final class BasketAddRemoveCallEvent extends StuffEvent {
  final String productId;
  final BasketAddRemoveProduct status;

  const BasketAddRemoveCallEvent({
    required this.status,
    required this.productId,
  });

  @override
  List<Object?> get props => [
        status,
        productId,
      ];
}

final class DeleteItemCallEvent extends StuffEvent {
  final String productId;

  const DeleteItemCallEvent({required this.productId});

  @override
  List<Object?> get props => [productId];
}
