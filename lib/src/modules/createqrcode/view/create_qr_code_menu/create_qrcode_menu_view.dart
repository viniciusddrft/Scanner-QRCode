import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'components/create_qrcode_menu_item.dart';

class CreateQRCodeMenu extends StatelessWidget {
  const CreateQRCodeMenu({super.key});

  List<Map<String, dynamic>> allOptionsQRCodeCreate(
    BuildContext context,
    Size size,
  ) {
    return [
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
          color: Colors.white,
          size: size.height * 0.05,
        ),
        'text': AppLocalizations.of(context)!.createQRCodeMenuInstagram,
        'typeQRCode': 'instagram',
        'color': const Color(0xffD23F98)
      },
      {
        'icon': Icon(
          FontAwesomeIcons.tiktok,
          color: Colors.white,
          size: size.height * 0.05,
        ),
        'text': AppLocalizations.of(context)!.createQRCodeMenuTiktok,
        'typeQRCode': 'tiktok',
        'color': const Color(0xff010101)
      },
      {
        'icon': Icon(
          FontAwesomeIcons.facebook,
          color: Colors.white,
          size: size.height * 0.05,
        ),
        'text': AppLocalizations.of(context)!.createQRCodeMenuFacebook,
        'typeQRCode': 'facebook',
        'color': const Color(0xff3b5998)
      },
      {
        'icon': Icon(
          FontAwesomeIcons.youtube,
          color: Colors.white,
          size: size.height * 0.05,
        ),
        'text': AppLocalizations.of(context)!.createQRCodeMenuYoutube,
        'typeQRCode': 'youtube',
        'color': Colors.red
      },
      {
        'icon': Icon(
          FontAwesomeIcons.twitter,
          color: Colors.white,
          size: size.height * 0.05,
        ),
        'text': AppLocalizations.of(context)!.createQRCodeMenuTwitter,
        'typeQRCode': 'twitter',
        'color': const Color(0xff1DA1F2)
      },
      {
        'icon': Icon(
          FontAwesomeIcons.twitch,
          color: Colors.white,
          size: size.height * 0.05,
        ),
        'text': AppLocalizations.of(context)!.createQRCodeMenuTwitch,
        'typeQRCode': 'twitch',
        'color': const Color(0xff9146FF)
      },
      {
        'icon': Icon(
          FontAwesomeIcons.reddit,
          color: Colors.white,
          size: size.height * 0.05,
        ),
        'text': AppLocalizations.of(context)!.createQRCodeMenuReddit,
        'typeQRCode': 'reddit',
        'color': const Color(0xffFF4500)
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height,
      width: size.width,
      child: GridView.builder(
        itemCount: allOptionsQRCodeCreate(context, size).length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) => CreateQRCodeItemMenu(
          typeQRCode: allOptionsQRCodeCreate(context, size)[index]
              ['typeQRCode'],
          icon: allOptionsQRCodeCreate(context, size)[index]['icon'],
          text: allOptionsQRCodeCreate(context, size)[index]['text'],
          color: allOptionsQRCodeCreate(context, size)[index]['color'],
        ),
      ),
    );
  }
}
