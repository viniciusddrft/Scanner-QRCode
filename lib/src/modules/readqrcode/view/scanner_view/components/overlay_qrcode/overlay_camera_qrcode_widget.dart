import 'package:flutter/material.dart';

import 'components/center_of_screen_qrcode_widget.dart';
import 'components/side_bar_overlay_qrcode_widget.dart';
import 'components/top_and_botton_bar_overlay_qrcode_widget.dart';

class OverlayCameraQrcodeWidget extends StatelessWidget {
  const OverlayCameraQrcodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Flexible(
          child: SideBarQrcodeWidget(),
        ),
        Flexible(
          flex: 3,
          child: SizedBox(
            child: Column(
              children: const [
                Flexible(
                  flex: 7,
                  child: TopAndBottonBarQrcodeWidget(),
                ),
                Flexible(
                  flex: 6,
                  child: CenterOfScreenQrcodeWidget(),
                ),
                Flexible(
                  flex: 7,
                  child: TopAndBottonBarQrcodeWidget(),
                )
              ],
            ),
          ),
        ),
        const Flexible(
          child: SideBarQrcodeWidget(),
        )
      ],
    );
  }
}
