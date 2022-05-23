import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/button_contact.dart';
import 'components/button_custom_qrcode.dart';
import 'components/button_help.dart';
import 'components/button_premium.dart';
import 'components/button_rate_app.dart';
import 'components/button_switch_language.dart';
import 'components/button_switch_theme.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        const ButtonPremium(),
        const ButtonCustomQRCode(),
        const ButtonSwicthTheme(),
        const ButtonSwitchLanguage(),
        const ButtonRateApp(),
        const ButtonHelp(),
        const ButtonContact(),
        const Spacer(),
        Padding(
          padding: EdgeInsets.only(
              bottom: size.height * 0.04, top: size.height * 0.04),
          child: Text(
            '${AppLocalizations.of(context)!.settingsVersion} 2.5.1',
            style: GoogleFonts.yatraOne(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
