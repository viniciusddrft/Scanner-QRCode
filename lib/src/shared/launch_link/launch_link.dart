import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

mixin OpenLink {
  Future<void> openLink(String url, {VoidCallback? onError}) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: false, forceSafariVC: false);
    } else {
      if (onError != null) {
        onError();
      }
    }
  }
}
