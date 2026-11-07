import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:camera/camera.dart';
import 'package:scannerqrcode/core/l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';

import 'components/mode_scan_enum.dart';
import 'components/overlay_barcode/overlay_camera_barcode_widget.dart';
import 'components/overlay_qrcode/overlay_camera_qrcode_widget.dart';

class ScannerCameraView extends StatefulWidget {
  final List<CameraDescription> cameras;
  const ScannerCameraView({required this.cameras, super.key});

  @override
  State<ScannerCameraView> createState() => _ScannerCameraViewState();
}

class _ScannerCameraViewState extends State<ScannerCameraView>
    with WidgetsBindingObserver {
  final ValueNotifier<ModeScan> _modeScan =
      ValueNotifier<ModeScan>(ModeScan.qrcode);
  final BarcodeScanner _scanner = BarcodeScanner();
  CameraController? _controller;
  final ValueNotifier<bool> _isLoadCam = ValueNotifier<bool>(false);
  bool _isCamBack = true;
  final ValueNotifier<bool> _isFlashOn = ValueNotifier<bool>(false);
  late final Size _size = MediaQuery.sizeOf(context);

  /// Já encontrou um código e está navegando para o resultado.
  bool _handled = false;

  /// Um frame está sendo processado pelo ML Kit; frames novos são descartados.
  bool _isProcessing = false;

  CameraDescription get _currentCamera =>
      _isCamBack ? widget.cameras.first : widget.cameras.last;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    onNewCameraSelected(widget.cameras.first);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_handled) return;

    if (state == AppLifecycleState.inactive) {
      final CameraController? cameraController = _controller;
      if (cameraController == null) return;
      _controller = null;
      _isLoadCam.value = false;
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed && _controller == null) {
      onNewCameraSelected(_currentCamera);
    }
  }

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    final previousCameraController = _controller;

    final CameraController cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.medium,
      imageFormatGroup: Platform.isAndroid
          ? ImageFormatGroup.nv21
          : ImageFormatGroup.bgra8888,
      enableAudio: false,
    );
    await previousCameraController?.dispose();

    if (mounted) {
      _controller = cameraController;
      _isLoadCam.value = false;
    }

    try {
      await cameraController.initialize();
      cameraController.startImageStream(_processImage);
    } on CameraException catch (e) {
      debugPrint('Error initializing camera: $e');
    }

    if (mounted) {
      _isLoadCam.value = _controller?.value.isInitialized ?? false;
    }
  }

  void _closeCameraAndShowResult(String code, BarcodeType type) async {
    final CameraController? controller = _controller;
    if (controller != null && controller.value.isStreamingImages) {
      await controller.stopImageStream();
    }
    if (mounted) _showResult(code, type);
  }

  void _showResult(String code, BarcodeType type) =>
      Navigator.popAndPushNamed(context, '/ReadQRCodeResult',
          arguments: <String, Object>{'result': code, 'typeCode': type});

  InputImage? _inputImageFromCameraImage(CameraImage image) {
    final camera = _currentCamera;
    final rotation =
        InputImageRotationValue.fromRawValue(camera.sensorOrientation);
    if (rotation == null) return null;
    final format = InputImageFormatValue.fromRawValue(image.format.raw);
    if (format == null ||
        (Platform.isAndroid && format != InputImageFormat.nv21) ||
        (Platform.isIOS && format != InputImageFormat.bgra8888)) {
      return null;
    }
    if (image.planes.length != 1) return null;
    final plane = image.planes.first;
    return InputImage.fromBytes(
      bytes: plane.bytes,
      metadata: InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: rotation,
        format: format,
        bytesPerRow: plane.bytesPerRow,
      ),
    );
  }

  void _processImage(CameraImage cameraImage) async {
    if (_handled || _isProcessing) return;
    _isProcessing = true;
    try {
      final inputImage = _inputImageFromCameraImage(cameraImage);
      if (inputImage != null) {
        final codes = await _scanner.processImage(inputImage);
        for (final code in codes) {
          final String? value = code.rawValue;
          if (!_handled &&
              value != null &&
              !value.contains('errorCode') &&
              !value.contains('typeNumber')) {
            _handled = true;
            _closeCameraAndShowResult(value, code.type);
            break;
          }
        }
      }
    } on PlatformException catch (error, stackStrace) {
      debugPrint('ERROR PlatformException --> $error');
      debugPrint('ERROR PlatformException --> $stackStrace');
    } catch (error, stackStrace) {
      debugPrint('ERROR --> $error');
      debugPrint('ERROR --> $stackStrace');
    } finally {
      _isProcessing = false;
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

  void _changeModeScanBarcode() => _modeScan.value = ModeScan.barcode;

  void _changeModeScanQrcode() => _modeScan.value = ModeScan.qrcode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 90,
        backgroundColor: Colors.transparent,
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              'Modos de Scan',
              style: TextStyle(fontSize: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 2,
                  child: FloatingActionButton(
                    heroTag: 'changeToBarcodeMode',
                    tooltip: AppLocalizations.of(context)!.scanViewTooltip5,
                    backgroundColor: Colors.red,
                    onPressed: _changeModeScanBarcode,
                    child: const Center(
                      child: FaIcon(
                        FontAwesomeIcons.barcode,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Flexible(
                  flex: 2,
                  child: FloatingActionButton(
                    heroTag: 'changeToQrcodeMode',
                    tooltip: AppLocalizations.of(context)!.scanViewTooltip6,
                    backgroundColor: Colors.red,
                    onPressed: _changeModeScanQrcode,
                    child: const Center(
                      child: Icon(
                        Icons.qr_code,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      extendBodyBehindAppBar: true,
      body: AnimatedBuilder(
        animation: Listenable.merge([_isLoadCam, _modeScan]),
        builder: (BuildContext context, Widget? child) => _isLoadCam.value
            ? GestureDetector(
                onScaleUpdate: (ScaleUpdateDetails details) async {
                  final double maxZoomLevel =
                      await _controller!.getMaxZoomLevel();

                  final double mimZoomLevel =
                      await _controller!.getMinZoomLevel();

                  final double dragIntensity = details.scale;

                  if (dragIntensity < 1) {
                    _controller!.setZoomLevel(mimZoomLevel);
                  } else if (dragIntensity > 1 &&
                      dragIntensity < maxZoomLevel) {
                    _controller!.setZoomLevel(dragIntensity);
                  } else {
                    _controller!.setZoomLevel(maxZoomLevel);
                  }
                },
                child: Stack(children: [
                  SizedBox(
                    height: _size.height,
                    width: _size.width,
                    child: CameraPreview(_controller!),
                  ),
                  _modeScan.value == ModeScan.qrcode
                      ? const OverlayCameraQrcodeWidget()
                      : const OlverlayCameraBarcodeWidget()
                ]),
              )
            : Stack(
                children: [
                  Center(
                    child: SizedBox(
                      height: _modeScan.value == ModeScan.qrcode ? 200 : 100,
                      width: _modeScan.value == ModeScan.qrcode ? 200 : 100,
                      child: const CircularProgressIndicator(
                        strokeWidth: 7,
                      ),
                    ),
                  ),
                  _modeScan.value == ModeScan.qrcode
                      ? const OverlayCameraQrcodeWidget()
                      : const OlverlayCameraBarcodeWidget()
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
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
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
                  Icon(
                value ? Icons.flash_on : Icons.flash_off,
                color: Colors.white,
              ),
            ),
          ),
          FloatingActionButton(
            heroTag: 'controllFromAndBackCamera',
            tooltip: AppLocalizations.of(context)!.scanViewTooltip4,
            backgroundColor: Colors.red,
            onPressed: controllFromAndBackCamera,
            child: const Icon(
              Icons.cameraswitch,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller?.dispose();
    _scanner.close();
    _isLoadCam.dispose();
    _isFlashOn.dispose();
    _modeScan.dispose();
    super.dispose();
  }
}
