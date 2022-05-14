import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'controller/settings_create_qrcode.dart';
import 'components/button_switch_color.dart';
import 'components/button_switch_logo.dart';
import 'components/button_switch_shape.dart';
import 'components/qr_code_example.dart';

class SettingsQRCodePage extends StatefulWidget {
  const SettingsQRCodePage({super.key});

  @override
  State<SettingsQRCodePage> createState() => _SettingsQRCodePageState();
}

class _SettingsQRCodePageState extends State<SettingsQRCodePage> {
  late final Size _size;

  @override
  void didChangeDependencies() {
    _size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settingsQRCodeCreation),
      ),
      body: Column(
        children: [
          ButtonSwitchColor(
            colorChange: SettingsCreateQRCode.colorQRBackground,
            savePreferenceKey: 'colorQRBackground',
            textButton:
                AppLocalizations.of(context)!.settingsButtonColorbackground,
          ),
          ButtonSwitchColor(
            colorChange: SettingsCreateQRCode.colorQRCode,
            savePreferenceKey: 'colorQRCode',
            textButton: AppLocalizations.of(context)!.settingsButtonColorCode,
          ),
          ButtonSwitchColor(
            colorChange: SettingsCreateQRCode.colorQRCodeEye,
            savePreferenceKey: 'colorQRCodeEye',
            textButton: AppLocalizations.of(context)!.settingsButtonColorEye,
          ),
          ButtonSwitchShape.body(
            bodyShape: SettingsCreateQRCode.shapeQRCode,
            colorBodyShape: SettingsCreateQRCode.colorQRCode,
          ),
          ButtonSwitchShape.eye(
            eyeShape: SettingsCreateQRCode.shapeQRCodeEye,
            colorEyeShape: SettingsCreateQRCode.colorQRCodeEye,
          ),
          const ButtonSwitchLogo(),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: _size.height * 0.07),
            child: const QRCodeExample(),
          )
        ],
      ),
    );
  }
}
