import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scannerqrcode/src/shared/launch_link/launch_link.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:scannerqrcode/src/shared/themes/text_themes.dart';

class ButtonUrl extends StatefulWidget {
  final String link;
  const ButtonUrl({required this.link, Key? key}) : super(key: key);

  @override
  State<ButtonUrl> createState() => _ButtonUrlState();
}

class _ButtonUrlState extends State<ButtonUrl> with OpenLink {
  void _popupError() async {
    Future.delayed(const Duration(seconds: 1), () => Navigator.pop(context));
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title:
            Text(AppLocalizations.of(context)!.scanResultpopupError + ' :/ '),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.h, bottom: 100.h, left: 20.w),
      child: ElevatedButton(
        onPressed: () => openLink(widget.link, onError: _popupError),
        child: SizedBox(
          width: 130.w,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              AppLocalizations.of(context)!.scanResultQrButtonOpen,
              style: AppTextThemes.readQrcodeButtons,
            ),
            const Icon(Icons.open_in_browser)
          ]),
        ),
      ),
    );
  }
}
