import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class CreateQrCodeController {
  final ScreenshotController screenshotController;

  const CreateQrCodeController({required this.screenshotController});

  Future<bool> saveImageQR() async {
    try {
      final Uint8List? imageQrCode = await screenshotController.capture();

      // Pasta do próprio app: não precisa de permissão de armazenamento.
      final directory = await getExternalStorageDirectory();
      final filePath =
          '${directory!.path}/qrcode_${DateTime.now().millisecondsSinceEpoch}.png';
      final file = File(filePath);

      await file.writeAsBytes(imageQrCode!.buffer.asUint8List());

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> shareImageQr() => screenshotController
      .captureAndSave(Directory.systemTemp.path)
      .then((file) =>
          SharePlus.instance.share(ShareParams(files: [XFile(file!)])));
}
