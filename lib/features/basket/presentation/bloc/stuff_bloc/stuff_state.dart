part of 'stuff_bloc.dart';

class StuffState extends Equatable {
  final bool isLoading;
  final List<ProductMockDataEntity>? stuffs;
  final Map<String, int>? productCount;

  const StuffState({
    required this.isLoading,
    this.productCount,
    this.stuffs,
  });

  factory StuffState.initialValue() {
    return const StuffState(isLoading: false);
  }

  StuffState copyWith({
    bool? isLoading,
    List<ProductMockDataEntity>? stuffs,
    Map<String, int>? productCount,
  }) {
    return StuffState(
      isLoading: isLoading ?? this.isLoading,
      productCount: productCount ?? this.productCount,
      stuffs: stuffs ?? this.stuffs,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        stuffs,
        productCount,
      ];
}
