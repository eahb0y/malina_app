import 'package:qr_code_scanner/qr_code_scanner.dart';

mixin QRScanMixin {
  late QRViewController controller;

  void disposeController() {
    controller.dispose();
  }
}
