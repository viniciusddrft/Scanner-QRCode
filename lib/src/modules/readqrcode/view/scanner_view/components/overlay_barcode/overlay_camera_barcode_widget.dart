import 'package:flutter/material.dart';

import 'components/center_of_screen_barcode_widget.dart';
import 'components/side_bar_overlay_barcode_widget.dart';
import 'components/top_and_bottom_bar_overlay_barcode_widget.dart';

class OlverlayCameraBarcodeWidget extends StatelessWidget {
  const OlverlayCameraBarcodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Flexible(
          child: SideBarBarcodeWidget(),
        ),
        Flexible(
          child: Column(
            children: const [
              Flexible(
                child: TopAndBottonBarBarcodeWidget(),
              ),
              Flexible(
                flex: 4,
                child: CenterOfScreenBarcodeWidget(),
              ),
              Flexible(
                child: TopAndBottonBarBarcodeWidget(),
              )
            ],
          ),
        ),
        const Flexible(
          child: SideBarBarcodeWidget(),
        )
      ],
    );
  }
}
