import 'package:flutter/material.dart';

mixin PopupNotices {
  void popupNotice(BuildContext context,
      {required String notice, required Duration duration}) {
    Future.delayed(duration, () => Navigator.pop(context));
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(notice),
      ),
    );
  }
}
