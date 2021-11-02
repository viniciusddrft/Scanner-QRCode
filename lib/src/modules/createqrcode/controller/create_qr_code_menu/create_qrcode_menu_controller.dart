import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class MenuItens {
  static final List<Map<String, dynamic>> allOptionsQRCodeCreate = [
    {
      'icon': Icon(Icons.text_snippet, size: 40.sp),
      'text': 'createQRCodeMenuText'.tr(),
      'typeQRCode': 'text',
      'color': Colors.lightBlue
    },
    {
      'icon': Icon(Icons.wifi, size: 40.sp),
      'text': 'createQRCodeMenuWifi'.tr(),
      'typeQRCode': 'wifi',
      'color': Colors.redAccent
    },
    {
      'icon': Icon(Icons.link, size: 40.sp),
      'text': 'createQRCodeMenuLink'.tr(),
      'typeQRCode': 'link',
      'color': Colors.grey
    },
    {
      'icon': Icon(Icons.contact_page, size: 40.sp),
      'text': 'createQRCodeMenuContact'.tr(),
      'typeQRCode': 'contact',
      'color': Colors.orange
    },
    {
      'icon': Icon(FontAwesomeIcons.github, size: 40.sp),
      'text': 'createQRCodeMenuGithub'.tr(),
      'typeQRCode': 'github',
      'color': Color(0xff2B2D30)
    },
    {
      'icon': Icon(FontAwesomeIcons.whatsapp, size: 40.sp),
      'text': 'createQRCodeMenuWhatsapp'.tr(),
      'typeQRCode': 'whatsapp',
      'color': Color(0xff30DD50)
    },
    {
      'icon':
          Icon(FontAwesomeIcons.instagram, color: Colors.white, size: 40.sp),
      'text': 'createQRCodeMenuInstagram'.tr(),
      'typeQRCode': 'instagram',
      'color': Color(0xffD23F98)
    },
    {
      'icon': Icon(FontAwesomeIcons.tiktok, color: Colors.white, size: 40.sp),
      'text': 'createQRCodeMenuTiktok'.tr(),
      'typeQRCode': 'tiktok',
      'color': Color(0xff010101)
    },
    {
      'icon': Icon(FontAwesomeIcons.facebook, color: Colors.white, size: 40.sp),
      'text': 'createQRCodeMenuFacebook'.tr(),
      'typeQRCode': 'facebook',
      'color': Color(0xff3b5998)
    },
    {
      'icon': Icon(FontAwesomeIcons.youtube, color: Colors.white, size: 40.sp),
      'text': 'createQRCodeMenuYoutube'.tr(),
      'typeQRCode': 'youtube',
      'color': Colors.red
    },
    {
      'icon': Icon(FontAwesomeIcons.twitter, color: Colors.white, size: 40.sp),
      'text': 'createQRCodeMenuTwitter'.tr(),
      'typeQRCode': 'twitter',
      'color': Color(0xff1DA1F2)
    },
    {
      'icon': Icon(FontAwesomeIcons.twitch, color: Colors.white, size: 40.sp),
      'text': 'createQRCodeMenuTwitch'.tr(),
      'typeQRCode': 'twitch',
      'color': Color(0xff9146FF)
    },
    {
      'icon': Icon(FontAwesomeIcons.reddit, color: Colors.white, size: 40.sp),
      'text': 'createQRCodeMenuReddit'.tr(),
      'typeQRCode': 'reddit',
      'color': Color(0xffFF4500)
    },
  ];
}
