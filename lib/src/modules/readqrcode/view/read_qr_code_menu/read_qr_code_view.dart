import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scannerqrcode/src/modules/readqrcode/controller/read_qr_code_menu_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ReadQRCodePage extends StatefulWidget {
  const ReadQRCodePage({Key? key}) : super(key: key);
  @override
  _ReadQRCodePageState createState() => _ReadQRCodePageState();
}

class _ReadQRCodePageState extends State<ReadQRCodePage> {
  void popupError() {
    Future.delayed(const Duration(seconds: 1), () => Navigator.pop(context));
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => const AlertDialog(
        title: Text('Error  :/'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

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
                onPressed: () async => ReadQrCodeController.scanCamera(context),
                child: SizedBox(
                  height: _size.height * 0.045,
                  width: _size.width * 0.35,
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
                onPressed: () =>
                    ReadQrCodeController.scanFile(context, popupError),
                child: SizedBox(
                  height: _size.height * 0.045,
                  width: _size.width * 0.35,
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
