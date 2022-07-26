import 'package:flutter/foundation.dart';

import 'package:url_launcher/url_launcher.dart';

mixin OpenLink {
  Never _errorOpenLink(String message) {
    throw Exception(message);
  }

  Future<void> openLink(String url, {VoidCallback? onError}) async {
    try {
      if (!await launchUrl(Uri.parse(url),
          mode: LaunchMode.externalApplication)) {
        onError ?? _errorOpenLink('Error in url launcher | not implemented ');
      }
    } catch (error, stackStrace) {
      debugPrint(error.toString());
      debugPrint(stackStrace.toString());
    }
  }
}
