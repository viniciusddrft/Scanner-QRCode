import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:scannerqrcode/src/modules/createqrcode/create_qr_code/view/components/body_form_onlyfans/body_form_onlyfans.dart';
import 'package:scannerqrcode/src/modules/createqrcode/create_qr_code/view/components/body_form_privacy/body_form_privacy.dart';

import '../../../../shared/admob/controller/admob_controller.dart';
import '../../../../shared/admob/widget/native_ad.dart';

import 'components/body_form_contact/body_form_contact.dart';
import 'components/body_form_facebook/body_form_facebook.dart';
import 'components/body_form_github/body_form_github.dart';
import 'components/body_form_instagram/body_form_instagram.dart';
import 'components/body_form_link/body_form_link.dart';
import 'components/body_form_reddit/body_form_reddit.dart';
import 'components/body_form_text/body_form_text.dart';
import 'components/body_form_tiktok/body_form_tiktok.dart';
import 'components/body_form_twitch/body_form_twitch.dart';
import 'components/body_form_twitter/body_form_twitter.dart';
import 'components/body_form_whatsapp/body_form_whatsapp.dart';
import 'components/body_form_wifi/body_form_wifi.dart';
import 'components/body_form_youtube/body_form_youtube.dart';

class CreateQRCodeView extends StatefulWidget {
  final String typeQRCode;
  const CreateQRCodeView({required this.typeQRCode, super.key});

  @override
  State<CreateQRCodeView> createState() => _CreateQRCodeViewState();
}

class _CreateQRCodeViewState extends State<CreateQRCodeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Builder(
          builder: (BuildContext context) {
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
            } else if (widget.typeQRCode == 'onlyfans') {
              return Text(
                  AppLocalizations.of(context)!.createQRCodeTitleOnlyfans);
            } else if (widget.typeQRCode == 'privacy') {
              return Text(
                  AppLocalizations.of(context)!.createQRCodeTitlePrivacy);
            } else {
              throw Exception('tipo inválido');
            }
          },
        ),
      ),
      body: Builder(
        builder: (BuildContext context) {
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
          } else if (widget.typeQRCode == 'onlyfans') {
            return const BodyFormOnlyfans();
          } else if (widget.typeQRCode == 'privacy') {
            return const BodyFormPrivacy();
          } else {
            throw Exception('tipo inválido');
          }
        },
      ),
      bottomNavigationBar: const SizedBox(
        height: 75,
        child: AdmobNativeAd(
          adUnitId: AdmobController.nativeAdUnitIDListTile,
          factoryId: 'listTile',
        ),
      ),
    );
  }
}
