import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:camera/camera.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ReadQrCodeController {
  const ReadQrCodeController();

  Future<List<CameraDescription>?> getAvailableCameras() async {
    final PermissionStatus statusCamera = await Permission.camera.request();
    if (!statusCamera.isGranted) return null;

    return availableCameras();
  }

  /// O image_picker usa o seletor de fotos do sistema, que não precisa de
  /// permissão de armazenamento.
  Future<Map<String, Object>?> scanFile() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) return null;

    final InputImage inputImage = InputImage.fromFilePath(image.path);
    final BarcodeScanner scanner = BarcodeScanner();

    try {
      final List<Barcode> barcodes = await scanner.processImage(inputImage);
      final Barcode? code = barcodes
          .where((Barcode b) =>
              b.rawValue != null &&
              !b.rawValue!.contains('typeNumber') &&
              !b.rawValue!.contains('errorCode'))
          .firstOrNull;

      if (code == null) return null;
      return {'result': code.rawValue!, 'typeCode': code.type};
    } on PlatformException catch (error, stackStrace) {
      debugPrint('ERROR PlatformException --> $error');
      debugPrint('ERROR PlatformException --> $stackStrace');
    } catch (error, stackStrace) {
      debugPrint('ERROR --> $error');
      debugPrint('ERROR --> $stackStrace');
    } finally {
      scanner.close();
    }
    return null;
  }
}
