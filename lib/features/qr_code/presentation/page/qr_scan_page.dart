import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:malina_delivery/constants/constants.dart';
import 'package:malina_delivery/core/theme/app_text_styles.dart';
import 'package:malina_delivery/core/widgets/loading/progress_hud.dart';
import 'package:malina_delivery/features/qr_code/presentation/bloc/qr_code_bloc.dart';
import 'package:malina_delivery/features/qr_code/presentation/page/dialog/qr_scan_food_dialog.dart';
import 'package:malina_delivery/features/qr_code/presentation/page/mixin/qr_scan_mixin.dart';
import 'package:malina_delivery/generated/l10n.dart';
import 'package:malina_delivery/route/app_routes.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanPage extends StatefulWidget {
  const QrScanPage({super.key});

  @override
  State<QrScanPage> createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> with QRScanMixin {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QrCodeBloc, QrCodeState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Positioned.fill(
                child: ModalProgressHUD(
                  inAsyncCall: state.isLoading,
                  child: QRView(
                    key: qrKey,
                    onQRViewCreated: _onQRViewCreated,
                    overlay: QrScannerOverlayShape(
                      borderColor: Colors.white,
                      borderRadius: 3,
                      borderLength: 33,
                      borderWidth: 3,
                      cutOutSize: 300.0,
                    ),
                    onPermissionSet: (ctrl, p) =>
                        _onPermissionSet(context, ctrl, p),
                  ),
                ),
              ),
              Positioned(
                top: 54,
                right: 17,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(
                      rootNavigatorKey.currentContext!,
                    );

                    // context
                    //     .read<QrCodeBloc>()
                    //     .add(OnQrCodeDetectCallEvent(code: "s12", orderType: ""));
                  },
                  child: SvgPicture.asset("assets/svg/ic_cancel.svg"),
                ),
              ),
              Positioned.fill(
                top: MediaQuery.of(context).size.height * 0.28,
                left: 76,
                child: Text(
                  AppLocalization.current.qr_title,
                  style: AppTextStyles.qrTitle,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _onQrDetect(Barcode value) async {
    if (value.code?.isNotEmpty ?? false) {
      controller.pauseCamera();
      if ((value.code?.contains("f") ?? false)){
        final result = await showDialog(
          context: context,
          builder: (_) => const QrScanFoodDialog(),
          barrierDismissible: false,
        );
        context
            .read<QrCodeBloc>()
            .add(OnQrCodeDetectCallEvent(code: value.code, orderType: result));
      } else {
        context
            .read<QrCodeBloc>()
            .add(OnQrCodeDetectCallEvent(code: value.code, orderType: ""));
      }
      // Resume the camera after the dialog is dismissed
      controller.resumeCamera();
    }
  }


  void _onQRViewCreated(QRViewController ctrl) {
    controller = ctrl;
    controller.scannedDataStream.listen(_onQrDetect);
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    debugPrint('_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    disposeController();
    super.dispose();
  }
}
