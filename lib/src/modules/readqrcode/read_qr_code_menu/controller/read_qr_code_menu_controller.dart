import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:camera/camera.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ReadQrCodeController {
  const ReadQrCodeController();

  Future<List<CameraDescription>?> getAvailableCameras() async {
    PermissionStatus statusCamera = await Permission.camera.status;
    PermissionStatus statusMicrophone = await Permission.microphone.status;

    if (statusCamera.isDenied) {
      statusCamera = await Permission.camera.request();
    }

    if (statusCamera.isDenied) return null;

    if (statusMicrophone.isDenied) {
      statusMicrophone = await Permission.microphone.request();
    }

    if (statusMicrophone.isDenied || statusCamera.isDenied) return null;

    final List<CameraDescription> cameras = await availableCameras();

    return cameras;
  }

  Future<Map<String, Object>?> scanFile() async {
    PermissionStatus statusStorage = await Permission.storage.status;
    if (statusStorage.isDenied) {
      statusStorage = await Permission.storage.request();
    }

    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) return null;

    final InputImage inputImage = InputImage.fromFilePath(image.path);
    final BarcodeScanner scanner = BarcodeScanner();

    try {
      return scanner.processImage(inputImage).then(
        (List<Barcode> code) {
          if (code.isNotEmpty) {
            if (!code.first.rawValue!.contains('typeNumber')) {
              if (!code.first.rawValue!.contains('errorCode')) {
                return {
                  'result': code.first.rawValue!,
                  'typeCode': code.first.type
                };
              } else {
                return null;
              }
            } else {
              return null;
            }
          } else {
            return null;
          }
        },
      ).whenComplete(() => scanner.close());
    } on PlatformException catch (error, stackStrace) {
      debugPrint('ERROR PlatformException --> $error');
      debugPrint('ERROR PlatformException --> $stackStrace');
    } catch (error, stackStrace) {
      debugPrint('ERROR --> $error');
      debugPrint('ERROR --> $stackStrace');
    }
    return null;
  }
}
