import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scannerqrcode/src/modules/readqrcode/view/scanner_view/components/overlay_camera_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScannerCameraView extends StatefulWidget {
  final List<CameraDescription> cameras;
  const ScannerCameraView({required this.cameras, Key? key}) : super(key: key);

  @override
  _ScannerCameraViewState createState() => _ScannerCameraViewState();
}

class _ScannerCameraViewState extends State<ScannerCameraView>
    with WidgetsBindingObserver {
  final BarcodeScanner _scanner = GoogleMlKit.vision.barcodeScanner();
  CameraController? _controller;
  final ValueNotifier<bool> _isLoadCam = ValueNotifier<bool>(false);
  bool _isCamBack = true;
  final ValueNotifier<bool> _isFlashOn = ValueNotifier<bool>(false);

  @override
  void initState() {
    onNewCameraSelected(widget.cameras.first);
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    _scanner.close();
    _isLoadCam.dispose();
    _isFlashOn.dispose();
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
      enableAudio: false,
    );
    await previousCameraController?.dispose();

    if (mounted) {
      setState(() {
        _controller = cameraController;
        _isLoadCam.value = false;
      });
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

    Navigator.popAndPushNamed(context, '/ReadQRCodeResult',
        arguments: <String, dynamic>{'result': code, 'typeCode': type});
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

      _scanner.processImage(_inputImage).then(
        (List<Barcode> code) {
          if (code.isNotEmpty) {
            if (!code.first.value.rawValue!.contains('typeNumber')) {
              if (!code.first.value.rawValue!.contains('errorCode')) {
                _showResult(
                    code.first.value.rawValue as String, code.first.value.type);
              } else {
                throw Exception('Error in reading => typeNumber in value');
              }
            } else {
              throw Exception('Error in reading => errorCode in value');
            }
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

  void controllFromAndBackCamera() {
    if (_isCamBack) {
      onNewCameraSelected(widget.cameras.last);
      _isCamBack = false;
    } else {
      onNewCameraSelected(widget.cameras.first);
      _isCamBack = true;
    }
  }

  void controllFlash() {
    if (!_isFlashOn.value) {
      _controller?.setFlashMode(FlashMode.torch);
      _isFlashOn.value = true;
    } else {
      _controller?.setFlashMode(FlashMode.off);
      _isFlashOn.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: _isLoadCam,
        builder: (BuildContext context, bool value, Widget? child) => value
            ? Stack(children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: CameraPreview(_controller!),
                ),
                const OverlayCameraWidget()
              ])
            : Stack(
                children: [
                  Center(
                    child: SizedBox(
                      height: 200.h,
                      width: 200.w,
                      child: const CircularProgressIndicator(
                        strokeWidth: 7,
                      ),
                    ),
                  ),
                  const OverlayCameraWidget()
                ],
              ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            heroTag: 'back',
            tooltip: AppLocalizations.of(context)!.scanViewTooltip1,
            backgroundColor: Colors.red,
            onPressed: () => Navigator.of(context).pop(),
            child: const Icon(Icons.arrow_back),
          ),
          FloatingActionButton(
            heroTag: 'controllFlash',
            tooltip: _isFlashOn.value
                ? AppLocalizations.of(context)!.scanViewTooltip3
                : AppLocalizations.of(context)!.scanViewTooltip2,
            backgroundColor: Colors.red,
            onPressed: controllFlash,
            child: ValueListenableBuilder(
              valueListenable: _isFlashOn,
              builder: (BuildContext context, bool value, Widget? child) =>
                  Icon(value ? Icons.flash_on : Icons.flash_off),
            ),
          ),
          FloatingActionButton(
            heroTag: 'controllFromAndBackCamera',
            tooltip: AppLocalizations.of(context)!.scanViewTooltip4,
            backgroundColor: Colors.red,
            onPressed: controllFromAndBackCamera,
            child: const Icon(Icons.cameraswitch),
          ),
        ],
      ),
    );
  }
}
