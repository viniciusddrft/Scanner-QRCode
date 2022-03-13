import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../shared/launch_link/launch_link.dart';

class ButtonRateApp extends StatelessWidget with OpenLink {
  const ButtonRateApp({Key? key}) : super(key: key);

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
        onPressed: () => openLink(
            'https://play.google.com/store/apps/details?id=com.scannerqrcode'),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: _size.width * 0.07),
          child: Row(
            children: [
              Flexible(
                flex: 5,
                child: Icon(
                  Icons.rate_review_outlined,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
              const Spacer(),
              Flexible(
                flex: 5,
                child: Text(
                  AppLocalizations.of(context)!.settingsRateTheApp,
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
