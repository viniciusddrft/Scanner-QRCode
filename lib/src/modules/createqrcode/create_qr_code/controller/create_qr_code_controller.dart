import 'dart:io';
import 'dart:typed_data';

import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class CreateQrCodeController {
  final ScreenshotController screenshotController;

  const CreateQrCodeController({required this.screenshotController});

  Future<bool> saveImageQR() async {
    final PermissionStatus status = await Permission.storage.status;
    if (status.isDenied) await Permission.storage.request();

    final Uint8List? imageQrCode = await screenshotController.capture();

    final Map result =
        await ImageGallerySaver.saveImage(imageQrCode!.buffer.asUint8List());

    return (result['isSuccess']);
  }

  Future<void> shareImageQr() => screenshotController
      .captureAndSave(Directory.systemTemp.path)
      .then((file) => Share.shareXFiles([XFile(file!)]));
}
