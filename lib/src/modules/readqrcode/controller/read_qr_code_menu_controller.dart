import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:camera/camera.dart';

import '../../../shared/popup_notices/popup_notices.dart';

class ReadQrCodeController with PopupNotices {
  final BuildContext context;

  const ReadQrCodeController(this.context);

  void _moveToScannerCameraPage(List<CameraDescription> cameras) {
    Navigator.pushNamed(context, '/ScannerCamera',
        arguments: <String, dynamic>{'cameras': cameras});
  }

  Future<void> scanCamera() async {
    PermissionStatus statusCamera = await Permission.camera.status;
    PermissionStatus statusMicrophone = await Permission.microphone.status;

    if (statusCamera.isDenied) {
      statusCamera = await Permission.camera.request();
    }

    if (statusCamera.isDenied) return;

    if (statusMicrophone.isDenied) {
      statusMicrophone = await Permission.microphone.request();
    }

    if (statusMicrophone.isDenied || statusCamera.isDenied) return;

    final List<CameraDescription> cameras = await availableCameras();

    _moveToScannerCameraPage(cameras);
  }

  Future<void> scanFile() async {
    PermissionStatus statusStorage = await Permission.storage.status;
    if (statusStorage.isDenied) {
      statusStorage = await Permission.storage.request();
    }

    if (statusStorage.isDenied) return;

    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) return;

    final InputImage inputImage = InputImage.fromFilePath(image.path);
    final BarcodeScanner scanner = BarcodeScanner();

    try {
      scanner.processImage(inputImage).then(
        (List<Barcode> code) {
          if (code.isNotEmpty) {
            if (!code.first.rawValue!.contains('typeNumber')) {
              if (!code.first.rawValue!.contains('errorCode')) {
                Navigator.pushNamed(context, '/ReadQRCodeResult',
                    arguments: <String, dynamic>{
                      'result': code.first.rawValue,
                      'typeCode': code.first.type
                    });
              } else {
                popupNotice(context,
                    notice: 'Error  :/', duration: const Duration(seconds: 1));
                throw Exception('Error in reading => typeNumber in value');
              }
            } else {
              popupNotice(context,
                  notice: 'Error  :/', duration: const Duration(seconds: 1));
              throw Exception('Error in reading => errorCode in value');
            }
          } else {
            popupNotice(context,
                notice: 'Error  :/', duration: const Duration(seconds: 1));
          }
          scanner.close();
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
