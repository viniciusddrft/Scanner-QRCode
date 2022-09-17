import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'components/button_switch_color.dart';
import 'components/button_switch_logo.dart';
import 'components/button_switch_shape.dart';
import 'components/qr_code_example.dart';

class SettingsQRCodePage extends StatelessWidget {
  const SettingsQRCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settingsQRCodeCreation),
      ),
      body: Column(
        children: const [
          ButtonSwitchColor.colorQRBackground(),
          ButtonSwitchColor.colorQRCode(),
          ButtonSwitchColor.colorQRCodeEye(),
          ButtonSwitchShape.body(),
          ButtonSwitchShape.eye(),
          ButtonSwitchLogo(),
          Spacer(),
          QRCodeExample(),
          Spacer(),
        ],
      ),
    );
  }
}
