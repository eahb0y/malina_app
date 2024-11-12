part of 'qr_code_bloc.dart';

sealed class QrCodeEvent extends Equatable {
  const QrCodeEvent();
}

final class OnQrCodeDetectCallEvent extends QrCodeEvent {
  final String? code;
  final String? orderType;

  const OnQrCodeDetectCallEvent({
    required this.code,
    required this.orderType,
  });

  @override
  List<Object?> get props => [code, orderType];
}
