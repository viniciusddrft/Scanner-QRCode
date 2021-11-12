import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scannerqrcode/src/modules/readqrcode/view/result_read_code/resultreadcode_view.dart';

class ScannerWidget extends StatefulWidget {
  final List<CameraDescription> cameras;
  const ScannerWidget({required this.cameras, Key? key}) : super(key: key);

  @override
  _ScannerWidgetState createState() => _ScannerWidgetState();
}

class _ScannerWidgetState extends State<ScannerWidget>
    with WidgetsBindingObserver {
  final BarcodeScanner _scanner = GoogleMlKit.vision.barcodeScanner();
  CameraController? _controller;
  final ValueNotifier<bool> _isLoadCam = ValueNotifier<bool>(false);

  @override
  void initState() {
    onNewCameraSelected(widget.cameras.first);
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = _controller;

    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      onNewCameraSelected(cameraController.description);
    }
  }

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    final previousCameraController = _controller;

    final CameraController cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.medium,
    );
    await previousCameraController?.dispose();

    if (mounted) {
      setState(() => _controller = cameraController);
    }
    cameraController.addListener(() {
      if (mounted) setState(() {});
    });

    try {
      await cameraController.initialize();
      cameraController
          .startImageStream((CameraImage image) => _processImage(image));
    } on CameraException catch (e) {
      debugPrint('Error initializing camera: $e');
    }

    if (mounted) {
      setState(() => _isLoadCam.value = _controller!.value.isInitialized);
    }
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
                  widget.cameras.first.sensorOrientation) ??
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

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isLoadCam,
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
                child: const CircularProgressIndicator(
                  strokeWidth: 7,
                ),
              ),
            ),
    );
  }
}
