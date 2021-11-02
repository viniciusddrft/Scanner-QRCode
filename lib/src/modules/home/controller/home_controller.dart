import 'package:flutter/material.dart';

class HomeController {
  static final ValueNotifier qrcodeButton = ValueNotifier<Color>(Colors.red);
  static final ValueNotifier createButton = ValueNotifier<Color>(Colors.white);
  static final ValueNotifier settingsButton =
      ValueNotifier<Color>(Colors.white);

  static void _selectIcon1() {
    qrcodeButton.value = Colors.red;
    createButton.value = Colors.white;
    settingsButton.value = Colors.white;
  }

  static void _selectIcon2() {
    qrcodeButton.value = Colors.white;
    createButton.value = Colors.red;
    settingsButton.value = Colors.white;
  }

  static void _selectIcon3() {
    qrcodeButton.value = Colors.white;
    createButton.value = Colors.white;
    settingsButton.value = Colors.red;
  }

  static void appBarControlleIconsColors(int valueControllerPage) {
    if (valueControllerPage == 0)
      _selectIcon1();
    else if (valueControllerPage == 1)
      _selectIcon2();
    else if (valueControllerPage == 2) _selectIcon3();
  }

  static void dispose() {
    qrcodeButton.dispose();
    createButton.dispose();
    settingsButton.dispose();
  }
}
