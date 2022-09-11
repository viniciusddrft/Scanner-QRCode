import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'components/button_switch_color.dart';
import 'components/button_switch_logo.dart';
import 'components/button_switch_shape.dart';
import 'components/qr_code_example.dart';
import '../../../shared/settings_qrcode/controller/settings_create_qrcode_controller.dart';

class SettingsQRCodePage extends StatefulWidget {
  const SettingsQRCodePage({super.key});

  @override
  State<SettingsQRCodePage> createState() => _SettingsQRCodePageState();
}

class _SettingsQRCodePageState extends State<SettingsQRCodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settingsQRCodeCreation),
      ),
      body: Column(
        children: [
          ButtonSwitchColor(
            colorChange: SettingsCreateQRCodeController.colorQRBackground,
            savePreferenceKey: 'colorQRBackground',
            textButton:
                AppLocalizations.of(context)!.settingsButtonColorbackground,
          ),
          ButtonSwitchColor(
            colorChange: SettingsCreateQRCodeController.colorQRCode,
            savePreferenceKey: 'colorQRCode',
            textButton: AppLocalizations.of(context)!.settingsButtonColorCode,
          ),
          ButtonSwitchColor(
            colorChange: SettingsCreateQRCodeController.colorQRCodeEye,
            savePreferenceKey: 'colorQRCodeEye',
            textButton: AppLocalizations.of(context)!.settingsButtonColorEye,
          ),
          ButtonSwitchShape.body(
            color: SettingsCreateQRCodeController.colorQRCode,
          ),
          ButtonSwitchShape.eye(
            color: SettingsCreateQRCodeController.colorQRCodeEye,
          ),
          const ButtonSwitchLogo(),
          const Spacer(),
          const QRCodeExample(),
          const Spacer(),
        ],
      ),
    );
  }
}
