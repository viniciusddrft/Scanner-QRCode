import 'package:flutter/material.dart';
import 'package:scannerqrcode/core/myapp.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    MobileAds.instance.initialize();
  } catch (e) {
    debugPrint(e.toString());
  }

  runApp(const MyApp());
}
