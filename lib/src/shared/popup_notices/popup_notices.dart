import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

mixin PopupNotices {
  void popupError(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () => Navigator.pop(context));
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => const AlertDialog(
        title: Text('Error  :/'),
      ),
    );
  }

  void popupSaved(BuildContext context) {
    Future.delayed(
        const Duration(milliseconds: 500), () => Navigator.pop(context));
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title:
            Text(AppLocalizations.of(context)!.createResultQrPopupSave + ' !'),
      ),
    );
  }

  void popupCopyBoard(BuildContext context) {
    Future.delayed(
        const Duration(milliseconds: 500), () => Navigator.pop(context));
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.scanResultPopupCopy + '.'),
      ),
    );
  }
}
