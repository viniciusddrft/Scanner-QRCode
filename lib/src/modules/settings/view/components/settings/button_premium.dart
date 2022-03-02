import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scannerqrcode/src/shared/launch_link/launch_link.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ButtonPremium extends StatelessWidget with OpenLink {
  const ButtonPremium({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return SizedBox(
      height: _size.height * 0.09,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero, primary: Colors.black87),
        onPressed: () => openLink(
            'https://play.google.com/store/apps/details?id=com.scannerqrcode_premium'),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              FontAwesomeIcons.crown,
              color: Colors.red,
            ),
            Text(
              AppLocalizations.of(context)!
                  .settingsQRCodeDownloadPremiumVersion,
              style: const TextStyle(fontSize: 16),
            ),
            const Icon(
              FontAwesomeIcons.crown,
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
