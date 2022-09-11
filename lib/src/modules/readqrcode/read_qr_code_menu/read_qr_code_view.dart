import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scannerqrcode/src/shared/popup_notices/popup_notices.dart';

import 'controller/read_qr_code_menu_controller.dart';

class ReadQRCodePage extends StatefulWidget {
  const ReadQRCodePage({super.key});
  @override
  State<ReadQRCodePage> createState() => _ReadQRCodePageState();
}

class _ReadQRCodePageState extends State<ReadQRCodePage> with PopupNotices {
  final ReadQrCodeController _readQrCodeController =
      const ReadQrCodeController();
  late final Size size = MediaQuery.of(context).size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 5,
          child: Image.asset(
            'assets/icons/logo.png',
            height: 220,
            width: 220,
          ),
        ),
        Flexible(
          flex: 5,
          child: Text(
            'Scanner QRCode',
            style: GoogleFonts.roboto(
              color: Colors.red,
              textStyle: Theme.of(context).textTheme.displayLarge,
            ),
          ),
        ),
        const Spacer(),
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                onPressed: () => _readQrCodeController
                    .getAvailableCameras()
                    .then((List<CameraDescription>? value) {
                  if (value != null) {
                    Navigator.pushNamed(context, '/ScannerCamera',
                        arguments: value);
                  }
                }),
                child: SizedBox(
                  height: size.height * 0.045,
                  width: size.width * 0.35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!
                            .readQRCodeTextButtonReadCamera,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const Icon(
                        Icons.camera_alt,
                        size: 24,
                      )
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                onPressed: () => _readQrCodeController
                    .scanFile()
                    .then((Map<String, Object>? value) {
                  if (value != null) {
                    Navigator.pushNamed(context, '/ReadQRCodeResult',
                        arguments: value);
                  } else {
                    popupNotice(context,
                        notice: 'Error :/',
                        duration: const Duration(seconds: 1));
                  }
                }),
                child: SizedBox(
                  height: size.height * 0.045,
                  width: size.width * 0.35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!
                            .readQRCodeTextButtonReadGallery,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const Icon(
                        Icons.photo,
                        size: 24,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
