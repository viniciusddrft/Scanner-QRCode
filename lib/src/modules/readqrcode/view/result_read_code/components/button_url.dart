import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../shared/launch_link/launch_link.dart';
import '../../../../../shared/popup_notices/popup_notices.dart';

class ButtonUrl extends StatefulWidget {
  final String link;
  const ButtonUrl({required this.link, super.key});

  @override
  State<ButtonUrl> createState() => _ButtonUrlState();
}

class _ButtonUrlState extends State<ButtonUrl> with OpenLink, PopupNotices {
  late final Size _size;

  @override
  void didChangeDependencies() {
    _size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      onPressed: () => openLink(
        widget.link,
        onError: () => popupNotice(
          context,
          notice: 'Error  :/',
          duration: const Duration(seconds: 1),
        ),
      ),
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
