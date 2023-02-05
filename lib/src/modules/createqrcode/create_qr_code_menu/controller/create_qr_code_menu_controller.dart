import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateQrcodeMenuController {
  List<Map<String, Object>> allOptionsQRCodeCreate(
    BuildContext context,
    Size size,
  ) =>
      [
        {
          'icon': Icon(
            Icons.text_snippet,
            size: size.height * 0.05,
          ),
          'text': AppLocalizations.of(context)!.createQRCodeMenuText,
          'typeQRCode': 'text',
          'color': Colors.lightBlue
        },
        {
          'icon': Icon(
            Icons.wifi,
            size: size.height * 0.05,
          ),
          'text': AppLocalizations.of(context)!.createQRCodeMenuWifi,
          'typeQRCode': 'wifi',
          'color': Colors.redAccent
        },
        {
          'icon': Icon(
            Icons.link,
            size: size.height * 0.05,
          ),
          'text': AppLocalizations.of(context)!.createQRCodeMenuLink,
          'typeQRCode': 'link',
          'color': Colors.grey
        },
        {
          'icon': Icon(
            Icons.contact_page,
            size: size.height * 0.05,
          ),
          'text': AppLocalizations.of(context)!.createQRCodeMenuContact,
          'typeQRCode': 'contact',
          'color': Colors.orange
        },
        {
          'icon': Icon(
            FontAwesomeIcons.github,
            size: size.height * 0.05,
          ),
          'text': AppLocalizations.of(context)!.createQRCodeMenuGithub,
          'typeQRCode': 'github',
          'color': const Color(0xff2B2D30)
        },
        {
          'icon': Icon(
            FontAwesomeIcons.whatsapp,
            size: size.height * 0.05,
          ),
          'text': AppLocalizations.of(context)!.createQRCodeMenuWhatsapp,
          'typeQRCode': 'whatsapp',
          'color': const Color(0xff30DD50)
        },
        {
          'icon': Icon(
            FontAwesomeIcons.instagram,
            size: size.height * 0.05,
          ),
          'text': AppLocalizations.of(context)!.createQRCodeMenuInstagram,
          'typeQRCode': 'instagram',
          'color': const Color(0xffD23F98)
        },
        {
          'icon': Icon(
            FontAwesomeIcons.tiktok,
            size: size.height * 0.05,
          ),
          'text': AppLocalizations.of(context)!.createQRCodeMenuTiktok,
          'typeQRCode': 'tiktok',
          'color': const Color(0xff010101)
        },
        {
          'icon': Icon(
            FontAwesomeIcons.facebook,
            size: size.height * 0.05,
          ),
          'text': AppLocalizations.of(context)!.createQRCodeMenuFacebook,
          'typeQRCode': 'facebook',
          'color': const Color(0xff3b5998)
        },
        {
          'icon': Icon(
            FontAwesomeIcons.youtube,
            size: size.height * 0.05,
          ),
          'text': AppLocalizations.of(context)!.createQRCodeMenuYoutube,
          'typeQRCode': 'youtube',
          'color': Colors.red
        },
        {
          'icon': Icon(
            FontAwesomeIcons.twitter,
            size: size.height * 0.05,
          ),
          'text': AppLocalizations.of(context)!.createQRCodeMenuTwitter,
          'typeQRCode': 'twitter',
          'color': const Color(0xff1DA1F2)
        },
        {
          'icon': Icon(
            FontAwesomeIcons.twitch,
            size: size.height * 0.05,
          ),
          'text': AppLocalizations.of(context)!.createQRCodeMenuTwitch,
          'typeQRCode': 'twitch',
          'color': const Color(0xff9146FF)
        },
        {
          'icon': Icon(
            FontAwesomeIcons.reddit,
            size: size.height * 0.05,
          ),
          'text': AppLocalizations.of(context)!.createQRCodeMenuReddit,
          'typeQRCode': 'reddit',
          'color': const Color(0xffFF4500)
        },
      ];
}
