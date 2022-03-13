import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:camera/camera.dart';

import '../../../shared/popup_notices/popup_notices.dart';

class ReadQrCodeController with PopupNotices {
  final BuildContext context;

  const ReadQrCodeController(this.context);

  Future<void> scanCamera() async {
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

  Future<void> scanFile() async {
    PermissionStatus _statusStorage = await Permission.storage.status;
    if (_statusStorage.isDenied) {
      _statusStorage = await Permission.storage.request();
    }

    if (_statusStorage.isDenied) return;

    final _image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (_image == null) return;

    final InputImage _inputImage = InputImage.fromFilePath(_image.path);
    final BarcodeScanner _scanner = GoogleMlKit.vision.barcodeScanner();

    try {
      _scanner.processImage(_inputImage).then(
        (List<Barcode> code) {
          if (code.isNotEmpty) {
            if (!code.first.value.rawValue!.contains('typeNumber')) {
              if (!code.first.value.rawValue!.contains('errorCode')) {
                Navigator.pushNamed(context, '/ReadQRCodeResult',
                    arguments: <String, dynamic>{
                      'result': code.first.value.rawValue,
                      'typeCode': code.first.value.type
                    });
              } else {
                popupError(context);
                throw Exception('Error in reading => typeNumber in value');
              }
            } else {
              popupError(context);
              throw Exception('Error in reading => errorCode in value');
            }
          } else {
            popupError(context);
          }
          _scanner.close();
        },
      );
    } on PlatformException catch (error, stackStrace) {
      debugPrint('ERROR PlatformException --> $error');
      debugPrint('ERROR PlatformException --> $stackStrace');
    } catch (error, stackStrace) {
      debugPrint('ERROR --> $error');
      debugPrint('ERROR --> $stackStrace');
    }
  }
}
