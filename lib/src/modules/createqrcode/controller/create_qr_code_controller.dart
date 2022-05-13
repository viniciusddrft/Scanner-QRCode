import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/widgets.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../shared/popup_notices/popup_notices.dart';

class CreateQrCodeController with PopupNotices {
  final BuildContext context;
  final ScreenshotController screenshotController;

  const CreateQrCodeController(this.context,
      {required this.screenshotController});

  Future<void> saveImageQR() async {
    PermissionStatus status = await Permission.storage.status;
    if (status.isDenied) await Permission.storage.request();

    Uint8List? imageQrCode = await screenshotController.capture();

    var result =
        await ImageGallerySaver.saveImage(imageQrCode!.buffer.asUint8List());

    if ((result!['isSuccess'])) {
      _onSaveSucess();
    } else {
      _onSaveFailed();
    }
  }

  void _onSaveSucess() => popupNotice(
        context,
        notice: '${AppLocalizations.of(context)!.createResultQrPopupSave} !',
        duration: const Duration(milliseconds: 500),
      );

  void _onSaveFailed() => popupNotice(
        context,
        notice: 'Error  :/',
        duration: const Duration(seconds: 1),
      );

  Future<void> shareImageQr() => screenshotController
      .captureAndSave(Directory.systemTemp.path)
      .then((file) => Share.shareFiles([file!]));
}
