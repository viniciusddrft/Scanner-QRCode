import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:camera/camera.dart';

class ReadQrCodeController {
  static Future<void> scanCamera(BuildContext context) async {
    PermissionStatus _statusCamera = await Permission.camera.status;
    PermissionStatus _statusMicrophone = await Permission.microphone.status;

    if (_statusCamera.isDenied) {
      _statusCamera = await Permission.camera.request();
    }

    if (_statusCamera.isDenied) return;

    if (_statusMicrophone.isDenied) {
      _statusMicrophone = await Permission.microphone.request();
    }

    if (_statusMicrophone.isDenied || _statusCamera.isDenied) return;

    final List<CameraDescription> cameras = await availableCameras();

    Navigator.pushNamed(context, '/ScannerCamera',
        arguments: <String, dynamic>{'cameras': cameras});
  }

  static Future<void> scanFile(
      BuildContext context, VoidCallback popupError) async {
    Future<void> _showResult(String code, BarcodeType type) =>
        Navigator.pushNamed(context, '/ReadQRCodeResult',
            arguments: <String, dynamic>{'result': code, 'typeCode': type});

    PermissionStatus _statusStorage = await Permission.storage.status;
    if (_statusStorage.isDenied) {
      _statusStorage = await Permission.storage.request();
    }

    if (_statusStorage.isDenied) return;

    try {
      final _image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (_image == null) return;

      final InputImage _inputImage = InputImage.fromFilePath(_image.path);
      final BarcodeScanner _scanner = GoogleMlKit.vision.barcodeScanner();

      // this function process the image and show result or show error
      _scanner.processImage(_inputImage).then(
        (List<Barcode> code) {
          if (code.isNotEmpty) {
            if (!code.first.value.rawValue!.contains('typeNumber')) {
              if (!code.first.value.rawValue!.contains('errorCode')) {
                _showResult(
                    code.first.value.rawValue as String, code.first.value.type);
              } else {
                popupError();
              }
            } else {
              popupError();
            }
          } else {
            popupError();
          }
          _scanner.close();
        },
      );
    } on PlatformException catch (e) {
      debugPrint('ERROR --> $e');
    }
  }
}
