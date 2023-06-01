import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../shared/launch_link/launch_link.dart';

class ButtonContact extends StatelessWidget with OpenLink {
  const ButtonContact({super.key});

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
        onPressed: () => openLink('mailto:ScannerQRCode@protonmail.com'),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
          child: Row(
            children: [
              Flexible(
                flex: 5,
                child: Icon(Icons.email_outlined,
                    color: Theme.of(context).iconTheme.color),
              ),
              const Spacer(),
              Flexible(
                flex: 5,
                child: Text(
                  AppLocalizations.of(context)!.settingsContact,
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
