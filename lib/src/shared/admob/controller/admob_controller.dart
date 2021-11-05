import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Admob {
  static int _numBannerLoadAttempts = 0;
  static const int _maxFailedLoadAttempts = 3;

  static late int anchoredBannerHeightAd;
  static late int anchoredBannerWidthAd;

  static String get _bannerAdUnitId => Platform.isAndroid
      ? 'ca-app-pub-3443422868739312/5334250133'
      : 'ca-app-pub-3443422868739312/5334250133';

//------------------------------------------------------------------------------
  static Future<BannerAd?> createAnchoredBanner(BuildContext context) async {
    final AnchoredAdaptiveBannerAdSize? _size =
        await AdSize.getAnchoredAdaptiveBannerAdSize(
      Orientation.portrait,
      MediaQuery.of(context).size.width.truncate(),
    );

    if (_size == null) {
      debugPrint('Unable to get height of anchored banner.');
      return null;
    }

    final BannerAd banner = BannerAd(
      size: _size,
      request: const AdRequest(),
      adUnitId: _bannerAdUnitId,
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) => debugPrint('$BannerAd loaded.'),
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          debugPrint('Ad failed to load: $error');
          _numBannerLoadAttempts++;

          if (_numBannerLoadAttempts != _maxFailedLoadAttempts) {
            createAnchoredBanner(context);
          } else {
            ad.dispose();
          }
        },
        onAdOpened: (Ad ad) => debugPrint('$BannerAd onAdOpened.'),
        onAdClosed: (Ad ad) => debugPrint('$BannerAd onAdClosed.'),
        onAdImpression: (Ad ad) => debugPrint('Success|o| .'),
      ),
    );
    return banner;
  }

//------------------------------------------------------------------------------
  static BannerAd createBannerRetanguleAd() {
    final BannerAd banner = BannerAd(
      adUnitId: _bannerAdUnitId,
      size: AdSize.mediumRectangle,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) => debugPrint('Ad loaded.'),
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          debugPrint('Ad failed to load: $error');
          _numBannerLoadAttempts++;
          if (_numBannerLoadAttempts != _maxFailedLoadAttempts) {
            createBannerRetanguleAd();
          } else {
            ad.dispose();
          }
        },
        onAdOpened: (Ad ad) => debugPrint('Ad opened.'),
        onAdClosed: (Ad ad) => debugPrint('Ad closed'),
        onAdImpression: (Ad ad) => debugPrint('Success |O| .'),
      ),
    );
    return banner;
  }
}
