import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:scannerqrcode/src/modules/readqrcode/view/scanner_view/components/buttons_bar_widget.dart';
import 'package:scannerqrcode/src/modules/readqrcode/view/scanner_view/components/overlay_camera_widget.dart';
import 'package:scannerqrcode/src/modules/readqrcode/view/scanner_view/components/scanner_widget.dart';

class ScannerViewPage extends StatelessWidget {
  final List<CameraDescription> cameras;
  const ScannerViewPage({required this.cameras, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        ScannerWidget(cameras: cameras),
        const OverlayCameraWidget(),
        const BurronsBarWidget()
      ]),
    );
  }
}
