import 'package:flutter/material.dart';
import 'package:scannerqrcode/src/shared/launch_link/launch_link.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ButtonContact extends StatelessWidget with OpenLink {
  const ButtonContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return SizedBox(
      height: _size.height * 0.09,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: EdgeInsets.zero,
          primary: Theme.of(context).backgroundColor,
        ),
        onPressed: () => openLink('mailto:ScannerQRCode@protonmail.com'),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: _size.width * 0.07),
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
