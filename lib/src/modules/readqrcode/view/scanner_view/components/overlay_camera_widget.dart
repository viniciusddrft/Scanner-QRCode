import 'package:flutter/material.dart';
import 'package:scannerqrcode/src/modules/readqrcode/view/scanner_view/components/components/center_of_screen_widget.dart';
import 'package:scannerqrcode/src/modules/readqrcode/view/scanner_view/components/components/side_bar_overlay_widget.dart';
import 'package:scannerqrcode/src/modules/readqrcode/view/scanner_view/components/components/top_and_botton_bar_overlay_widget.dart';

class OverlayCameraWidget extends StatelessWidget {
  const OverlayCameraWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          const SideBar(),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width / 1.6669,
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
