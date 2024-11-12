part of 'qr_code_bloc.dart';

class QrCodeState extends Equatable {
  final bool isLoading;

  const QrCodeState({required this.isLoading});

  factory QrCodeState.initialValue() {
    return const QrCodeState(isLoading: false);
  }

  QrCodeState copyWith({
    bool? isLoading,
  }) {
    return QrCodeState(
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [isLoading];
}
