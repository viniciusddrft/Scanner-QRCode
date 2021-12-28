import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MenuItens {
  static List<Map<String, dynamic>> allOptionsQRCodeCreate(context) => [
        {
          'icon': Icon(Icons.text_snippet, size: 40.sp),
          'text': AppLocalizations.of(context)!.createQRCodeMenuText,
          'typeQRCode': 'text',
          'color': Colors.lightBlue
        },
        {
          'icon': Icon(Icons.wifi, size: 40.sp),
          'text': AppLocalizations.of(context)!.createQRCodeMenuWifi,
          'typeQRCode': 'wifi',
          'color': Colors.redAccent
        },
        {
          'icon': Icon(Icons.link, size: 40.sp),
          'text': AppLocalizations.of(context)!.createQRCodeMenuLink,
          'typeQRCode': 'link',
          'color': Colors.grey
        },
        {
          'icon': Icon(Icons.contact_page, size: 40.sp),
          'text': AppLocalizations.of(context)!.createQRCodeMenuContact,
          'typeQRCode': 'contact',
          'color': Colors.orange
        },
        {
          'icon': Icon(FontAwesomeIcons.github, size: 40.sp),
          'text': AppLocalizations.of(context)!.createQRCodeMenuGithub,
          'typeQRCode': 'github',
          'color': const Color(0xff2B2D30)
        },
        {
          'icon': Icon(FontAwesomeIcons.whatsapp, size: 40.sp),
          'text': AppLocalizations.of(context)!.createQRCodeMenuWhatsapp,
          'typeQRCode': 'whatsapp',
          'color': const Color(0xff30DD50)
        },
        {
          'icon': Icon(FontAwesomeIcons.instagram,
              color: Colors.white, size: 40.sp),
          'text': AppLocalizations.of(context)!.createQRCodeMenuInstagram,
          'typeQRCode': 'instagram',
          'color': const Color(0xffD23F98)
        },
        {
          'icon':
              Icon(FontAwesomeIcons.tiktok, color: Colors.white, size: 40.sp),
          'text': AppLocalizations.of(context)!.createQRCodeMenuTiktok,
          'typeQRCode': 'tiktok',
          'color': const Color(0xff010101)
        },
        {
          'icon':
              Icon(FontAwesomeIcons.facebook, color: Colors.white, size: 40.sp),
          'text': AppLocalizations.of(context)!.createQRCodeMenuFacebook,
          'typeQRCode': 'facebook',
          'color': const Color(0xff3b5998)
        },
        {
          'icon':
              Icon(FontAwesomeIcons.youtube, color: Colors.white, size: 40.sp),
          'text': AppLocalizations.of(context)!.createQRCodeMenuYoutube,
          'typeQRCode': 'youtube',
          'color': Colors.red
        },
        {
          'icon':
              Icon(FontAwesomeIcons.twitter, color: Colors.white, size: 40.sp),
          'text': AppLocalizations.of(context)!.createQRCodeMenuTwitter,
          'typeQRCode': 'twitter',
          'color': const Color(0xff1DA1F2)
        },
        {
          'icon':
              Icon(FontAwesomeIcons.twitch, color: Colors.white, size: 40.sp),
          'text': AppLocalizations.of(context)!.createQRCodeMenuTwitch,
          'typeQRCode': 'twitch',
          'color': const Color(0xff9146FF)
        },
        {
          'icon':
              Icon(FontAwesomeIcons.reddit, color: Colors.white, size: 40.sp),
          'text': AppLocalizations.of(context)!.createQRCodeMenuReddit,
          'typeQRCode': 'reddit',
          'color': const Color(0xffFF4500)
        },
      ];
}
