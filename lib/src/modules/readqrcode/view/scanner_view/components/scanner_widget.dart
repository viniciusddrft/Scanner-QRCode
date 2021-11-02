import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:scannerqrcode/src/modules/readqrcode/view/resultreadcode/resultreadcode_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScannerWidget extends StatefulWidget {
  final List<CameraDescription> camera;
  const ScannerWidget({required this.camera});

  @override
  _ScannerWidgetState createState() => _ScannerWidgetState();
}

class _ScannerWidgetState extends State<ScannerWidget>
    with WidgetsBindingObserver {
  final BarcodeScanner _scanner = GoogleMlKit.vision.barcodeScanner();
  final ValueNotifier<bool> _loadCam = ValueNotifier<bool>(false);
  CameraController? _controller;

  @override
  void initState() {
    _controller =
        CameraController(widget.camera.first, ResolutionPreset.medium);
    _controller!.initialize().then(
      (_) {
        _controller!
            .startImageStream((CameraImage image) => _processImage(image));
        _loadCam.value = _controller!.value.isInitialized;
      },
    );
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_controller == null || !_controller!.value.isInitialized) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      _controller?.dispose();
    } else if (state == AppLifecycleState.resumed) {
      if (_controller != null) {
        return;
      }
    }
  }

  @override
  void dispose() {
    disposeAll();
    super.dispose();
  }

  void _showResult(String code, BarcodeType type) async {
    if (_controller!.value.isStreamingImages) {
      await _controller!.stopImageStream();
      await _scanner.close();
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ResultReadCode(
          result: code,
          typecode: type,
        ),
      ),
    );
  }

  void _processImage(CameraImage cameraImage) {
    try {
      final WriteBuffer _allBytes = WriteBuffer();
      for (Plane _plane in cameraImage.planes) {
        _allBytes.putUint8List(_plane.bytes);
      }
      final _bytes = _allBytes.done().buffer.asUint8List();

      final Size _imageSize =
          Size(cameraImage.width.toDouble(), cameraImage.height.toDouble());

      final InputImageRotation _imageRotation =
          InputImageRotationMethods.fromRawValue(
                  widget.camera.first.sensorOrientation) ??
              InputImageRotation.Rotation_0deg;
      final InputImageFormat _inputImageFormat =
          InputImageFormatMethods.fromRawValue(cameraImage.format.raw) ??
              InputImageFormat.NV21;

      final _planeData = cameraImage.planes.map(
        (Plane plane) {
          return InputImagePlaneMetadata(
            bytesPerRow: plane.bytesPerRow,
            height: plane.height,
            width: plane.width,
          );
        },
      ).toList();

      final _inputImageData = InputImageData(
        size: _imageSize,
        imageRotation: _imageRotation,
        inputImageFormat: _inputImageFormat,
        planeData: _planeData,
      );

      final _inputImage =
          InputImage.fromBytes(bytes: _bytes, inputImageData: _inputImageData);

      _scanner.processImage(_inputImage).then((List<Barcode> code) =>
          code.isNotEmpty
              ? !code.first.value.displayValue!
                      .contains('typeNumber') // error in scan image :/
                  ? !code.first.value.displayValue!
                          .contains('errorCode') // error in scan image :/
                      ? _showResult(code.first.value.displayValue as String,
                          code.first.value.type)
                      : debugPrint('Error in scanner')
                  : debugPrint('Error in scanner')
              : null);
    } catch (e) {
      debugPrint('ERROR --> $e');
    }
  }

  void disposeAll() async {
    await _scanner.close();
    if (_controller!.value.isStreamingImages) {
      await _controller!.stopImageStream();
    }
    await _controller!.dispose();
    _controller = null;
    _loadCam.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _loadCam,
      builder: (BuildContext context, bool value, Widget? child) => value
          ? SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: CameraPreview(_controller!),
            )
          : Center(
              child: SizedBox(
                height: 200.h,
                width: 200.w,
                child: CircularProgressIndicator(
                  strokeWidth: 7,
                ),
              ),
            ),
    );
  }
}
