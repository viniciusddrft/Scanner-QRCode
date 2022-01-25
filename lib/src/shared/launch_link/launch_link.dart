import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

mixin OpenLink {
  Future<void> openLink(String url, {VoidCallback? onError}) async {
    try {
      if (await canLaunch(url)) {
        await launch(url, forceWebView: false, forceSafariVC: false);
      } else {
        if (onError != null) {
          onError();
        } else {
          throw Exception('Error in open link: not implemented error');
        }
      }
    } catch (error, stackStrace) {
      debugPrint(error.toString());
      debugPrint(stackStrace.toString());
    }
  }
}
