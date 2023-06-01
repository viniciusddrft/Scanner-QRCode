import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ButtonCustomQRCode extends StatelessWidget {
  const ButtonCustomQRCode({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return SizedBox(
      height: size.height * 0.09,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.background,
          padding: EdgeInsets.zero,
        ),
        onPressed: () => Navigator.pushNamed(context, '/SettingsQRCode'),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
          child: Row(
            children: [
              Flexible(
                flex: 5,
                child: Icon(
                  Icons.qr_code_2_outlined,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
              const Spacer(),
              Flexible(
                flex: 5,
                child: Text(
                  AppLocalizations.of(context)!.settingsQRCodeCreation,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
