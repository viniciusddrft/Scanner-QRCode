import 'package:flutter/material.dart';
import 'package:scannerqrcode/src/shared/launch_link/launch_link.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    final Size _size = MediaQuery.of(context).size;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      onPressed: () => openLink(widget.link, onError: _popupError),
      child: SizedBox(
        width: _size.width * 0.3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)!.scanResultQrButtonOpen,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Icon(Icons.open_in_browser)
          ],
        ),
      ),
    );
  }
}
