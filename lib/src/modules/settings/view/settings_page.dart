import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/settings/button_contact.dart';
import 'components/settings/button_custom_qrcode.dart';
import 'components/settings/button_help.dart';
import 'components/settings/button_premium.dart';
import 'components/settings/button_rate_app.dart';
import 'components/settings/button_switch_language.dart';
import 'components/settings/button_switch_theme.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

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
              bottom: _size.height * 0.04, top: _size.height * 0.04),
          child: Text(
            AppLocalizations.of(context)!.settingsVersion + ' 2.4.0',
            style: GoogleFonts.yatraOne(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
