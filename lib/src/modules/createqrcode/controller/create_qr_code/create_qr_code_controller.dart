import 'dart:io';
import 'dart:typed_data';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';

class CreateQrCodeController {
  static Future<bool> isTheImageQRSaved(
      ScreenshotController _screenshotController) async {
    PermissionStatus status = await Permission.storage.status;
    if (status.isDenied) await Permission.storage.request();

    Uint8List? imageQrCode = await _screenshotController.capture();

    var result =
        await ImageGallerySaver.saveImage(imageQrCode!.buffer.asUint8List());

    return ((result!['isSuccess']));
  }

  static Future<void> shareImageQr(
          ScreenshotController _screenshotController) async =>
      _screenshotController
          .captureAndSave(Directory.systemTemp.path)
          .then((file) => Share.shareFiles([file!]));
}
