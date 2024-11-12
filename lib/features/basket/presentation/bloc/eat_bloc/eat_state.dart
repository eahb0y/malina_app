part of 'eat_bloc.dart';

class EatState extends Equatable {
  final bool isDelivery;
  final bool isLoading;
  final List<ProductMockDataEntity>? eatBasketDelivery;
  final List<ProductMockDataEntity>? eatBasketOrderAt;
  final Map<String, int>? productsCount;

  const EatState({
    required this.isDelivery,
    required this.isLoading,
    this.eatBasketDelivery,
    this.eatBasketOrderAt,
    this.productsCount,
  });

  factory EatState.initialValue() {
    return const EatState(
      isDelivery: true,
      isLoading: false,
    );
  }

  EatState copyWith({
    bool? isDelivery,
    bool? isLoading,
    List<ProductMockDataEntity>? eatBasketDelivery,
    List<ProductMockDataEntity>? eatBasketOrderAt,
    Map<String, int>? productsCount,
  }) {
    return EatState(
      isDelivery: isDelivery ?? this.isDelivery,
      isLoading: isLoading ?? this.isLoading,
      eatBasketDelivery: eatBasketDelivery ?? this.eatBasketDelivery,
      eatBasketOrderAt: eatBasketOrderAt ?? this.eatBasketOrderAt,
      productsCount: productsCount ?? this.productsCount,
    );
  }

  @override
  List<Object?> get props => [
        isDelivery,
        isLoading,
        eatBasketDelivery,
        eatBasketOrderAt,
        productsCount,
      ];
}
