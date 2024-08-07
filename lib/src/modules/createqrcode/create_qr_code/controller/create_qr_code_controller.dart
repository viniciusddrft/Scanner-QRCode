import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class CreateQrCodeController {
  final ScreenshotController screenshotController;

  const CreateQrCodeController({required this.screenshotController});

  Future<bool> saveImageQR() async {
    try {
      final PermissionStatus status = await Permission.storage.status;
      if (status.isDenied) await Permission.storage.request();

      final Uint8List? imageQrCode = await screenshotController.capture();

      final directory = await getExternalStorageDirectory();
      final filePath = '${directory?.path}/$DateTime.now()';
      final file = File(filePath);

      await file.writeAsBytes(imageQrCode!.buffer.asUint8List());

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> shareImageQr() => screenshotController
      .captureAndSave(Directory.systemTemp.path)
      .then((file) => Share.shareXFiles([XFile(file!)]));
}
