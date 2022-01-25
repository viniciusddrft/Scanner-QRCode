import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:scannerqrcode/src/modules/createqrcode/view/create_qr_code/components/body_form_contact/body_form_contact.dart';
import 'package:scannerqrcode/src/modules/createqrcode/view/create_qr_code/components/body_form_facebook/body_form_facebook.dart';
import 'package:scannerqrcode/src/modules/createqrcode/view/create_qr_code/components/body_form_github/body_form_github.dart';
import 'package:scannerqrcode/src/modules/createqrcode/view/create_qr_code/components/body_form_instagram/body_form_instagram.dart';
import 'package:scannerqrcode/src/modules/createqrcode/view/create_qr_code/components/body_form_link/body_form_link.dart';
import 'package:scannerqrcode/src/modules/createqrcode/view/create_qr_code/components/body_form_reddit/body_form_reddit.dart';
import 'package:scannerqrcode/src/modules/createqrcode/view/create_qr_code/components/body_form_text/body_form_text.dart';
import 'package:scannerqrcode/src/modules/createqrcode/view/create_qr_code/components/body_form_tiktok/body_form_tiktok.dart';
import 'package:scannerqrcode/src/modules/createqrcode/view/create_qr_code/components/body_form_twitch/body_form_twitch.dart';
import 'package:scannerqrcode/src/modules/createqrcode/view/create_qr_code/components/body_form_twitter/body_form_twitter.dart';
import 'package:scannerqrcode/src/modules/createqrcode/view/create_qr_code/components/body_form_whatsapp/body_form_whatsapp.dart';
import 'package:scannerqrcode/src/modules/createqrcode/view/create_qr_code/components/body_form_wifi/body_form_wifi.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:scannerqrcode/src/modules/createqrcode/view/create_qr_code/components/body_form_youtube/body_form_youtube.dart';
import 'package:scannerqrcode/src/shared/admob/controller/admob_controller.dart';

class CreateQRCodeView extends StatefulWidget {
  final String typeQRCode;
  const CreateQRCodeView({required this.typeQRCode, Key? key})
      : super(key: key);

  @override
  _CreateQRCodeViewState createState() => _CreateQRCodeViewState();
}

class _CreateQRCodeViewState extends State<CreateQRCodeView> {
  bool _loadingAnchoredBanner = false;
  final ValueNotifier<AdWidget?> _adWidget = ValueNotifier<AdWidget?>(null);

  @override
  void didChangeDependencies() {
    if (!_loadingAnchoredBanner) {
      Admob.createAnchoredBanner(context).then((banner) {
        if (banner != null) {
          _adWidget.value = AdWidget(key: UniqueKey(), ad: banner..load());
          Admob.anchoredBannerHeightAd = banner.size.height;
          Admob.anchoredBannerWidthAd = banner.size.width;
        }
      }).whenComplete(() => _loadingAnchoredBanner = true);
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _adWidget.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (widget.typeQRCode == 'text') {
              return Text(AppLocalizations.of(context)!.createQRCodeTitleText);
            } else if (widget.typeQRCode == 'wifi') {
              return Text(AppLocalizations.of(context)!.createQRCodeTitleWifi);
            } else if (widget.typeQRCode == 'link') {
              return Text(AppLocalizations.of(context)!.createQRCodeTitleLink);
            } else if (widget.typeQRCode == 'contact') {
              return Text(
                  AppLocalizations.of(context)!.createQRCodeTitleContact);
            } else if (widget.typeQRCode == 'github') {
              return Text(
                  AppLocalizations.of(context)!.createQRCodeTitleGithub);
            } else if (widget.typeQRCode == 'whatsapp') {
              return Text(
                  AppLocalizations.of(context)!.createQRCodeTitleWhatsapp);
            } else if (widget.typeQRCode == 'instagram') {
              return Text(
                  AppLocalizations.of(context)!.createQRCodeTitleInstagram);
            } else if (widget.typeQRCode == 'tiktok') {
              return Text(
                  AppLocalizations.of(context)!.createQRCodeTitleTiktok);
            } else if (widget.typeQRCode == 'facebook') {
              return Text(
                  AppLocalizations.of(context)!.createQRCodeTitleFacebook);
            } else if (widget.typeQRCode == 'youtube') {
              return Text(
                  AppLocalizations.of(context)!.createQRCodeTitleYoutube);
            } else if (widget.typeQRCode == 'twitter') {
              return Text(
                  AppLocalizations.of(context)!.createQRCodeTitleTwitter);
            } else if (widget.typeQRCode == 'twitch') {
              return Text(
                  AppLocalizations.of(context)!.createQRCodeTitleTwitch);
            } else if (widget.typeQRCode == 'reddit') {
              return Text(
                  AppLocalizations.of(context)!.createQRCodeTitleReddit);
            } else {
              return Container();
            }
          },
        ),
      ),
      body: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (widget.typeQRCode == 'text') {
            return const BodyFormText();
          } else if (widget.typeQRCode == 'wifi') {
            return const BodyFormWifi();
          } else if (widget.typeQRCode == 'link') {
            return const BodyFormLink();
          } else if (widget.typeQRCode == 'contact') {
            return const BodyFormContact();
          } else if (widget.typeQRCode == 'github') {
            return const BodyFormGithub();
          } else if (widget.typeQRCode == 'whatsapp') {
            return const BodyFormWhatsapp();
          } else if (widget.typeQRCode == 'instagram') {
            return const BodyFormIstagram();
          } else if (widget.typeQRCode == 'tiktok') {
            return const BodyFormTiktok();
          } else if (widget.typeQRCode == 'facebook') {
            return const BodyFormFacebook();
          } else if (widget.typeQRCode == 'youtube') {
            return const BodyFormYoutube();
          } else if (widget.typeQRCode == 'twitter') {
            return const BodyFormTwitter();
          } else if (widget.typeQRCode == 'twitch') {
            return const BodyFormTwitch();
          } else if (widget.typeQRCode == 'reddit') {
            return const BodyFormReddit();
          } else {
            return Container();
          }
        },
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: _adWidget,
        builder: (BuildContext context, AdWidget? value, Widget? child) =>
            _loadingAnchoredBanner
                ? SizedBox(
                    height: Admob.anchoredBannerHeightAd.toDouble(),
                    width: Admob.anchoredBannerWidthAd.toDouble(),
                    child: value,
                  )
                : Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    color: Colors.transparent,
                  ),
      ),
    );
  }
}
