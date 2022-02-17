import 'package:google_mobile_ads/google_mobile_ads.dart';

//Example of how to implement
class AdmobController {
  static void initialize() => MobileAds.instance.initialize();

  static String get nativeAdUnitIDListTile => 'id ad';

  static String get nativeAdUnitIDRectangular => 'id ad';
}
