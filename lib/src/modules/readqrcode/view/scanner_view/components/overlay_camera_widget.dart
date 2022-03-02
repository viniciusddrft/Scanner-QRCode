import 'package:flutter/material.dart';
import 'package:scannerqrcode/src/modules/readqrcode/view/scanner_view/components/components/center_of_screen_widget.dart';
import 'package:scannerqrcode/src/modules/readqrcode/view/scanner_view/components/components/side_bar_overlay_widget.dart';
import 'package:scannerqrcode/src/modules/readqrcode/view/scanner_view/components/components/top_and_botton_bar_overlay_widget.dart';

class OverlayCameraWidget extends StatelessWidget {
  const OverlayCameraWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return SizedBox(
      height: _size.height,
      width: _size.width,
      child: Row(
        children: [
          const SideBar(),
          SizedBox(
            height: _size.height,
            width: _size.width * 0.6,
            child: Column(
              children: const [
                TopAndBottonBar(),
                CenterOfScreen(),
                TopAndBottonBar()
              ],
            ),
          ),
          const SideBar()
        ],
      ),
    );
  }
}
