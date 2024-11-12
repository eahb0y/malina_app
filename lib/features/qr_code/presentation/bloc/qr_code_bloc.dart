import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_delivery/core/functions/base_functions.dart';
import 'package:malina_delivery/core/local_source/local_source.dart';
import 'package:malina_delivery/core/mock_data/product_mock_data.dart';
import 'package:malina_delivery/core/product_model/product_model.dart';
import 'package:malina_delivery/generated/l10n.dart';
import 'package:malina_delivery/injector_container.dart';

part 'qr_code_event.dart';

part 'qr_code_state.dart';

class QrCodeBloc extends Bloc<QrCodeEvent, QrCodeState> {
  QrCodeBloc() : super(QrCodeState.initialValue()) {
    on<OnQrCodeDetectCallEvent>(_saveProductLocalCall);
  }

  Future<void> _saveProductLocalCall(
      OnQrCodeDetectCallEvent event, Emitter<QrCodeState> emit) async {
    emit(state.copyWith(isLoading: true));

    final localSource = sl<LocalSource>();
    final productCode = event.code ?? "";
    final response = await localSource.getEventById(productCode);

    if (response != null && response.orderType == event.orderType) {
      await localSource.updateEvent(
        Product(
          id: response.id,
          productId: response.productId,
          productName: response.productName,
          productCount: response.productCount + 1,
          inBasket: response.inBasket,
          orderType: response.orderType,
          productType: response.productType,
        ),
      );
    } else {
      final productFromMock = ProductMockData.productsList.firstWhere(
        (item) => item.productId == productCode,
      );
      await localSource.insertEvent(
        Product(
          id: productFromMock.id,
          productId: productFromMock.productId,
          productName: productFromMock.name ?? "",
          productCount: 1,
          inBasket: true,
          orderType: event.orderType ?? "",
          productType: productFromMock.productType ?? "",
        ),
      );
    }
    Functions.showAlertSnackBar(AppLocalization.current.product_add_basket);
    emit(state.copyWith(isLoading: false));
  }
}
