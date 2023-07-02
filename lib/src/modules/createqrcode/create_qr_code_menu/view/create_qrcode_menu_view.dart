import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:scannerqrcode/src/shared/models/create_qrcode_item_model.dart';

import 'components/create_qrcode_menu_item.dart';

class CreateQRCodeMenu extends StatefulWidget {
  const CreateQRCodeMenu({super.key});

  @override
  State<CreateQRCodeMenu> createState() => _CreateQRCodeMenuState();
}

class _CreateQRCodeMenuState extends State<CreateQRCodeMenu> {
  late final List<CreateQRCodeItemModel> listButtons;

  @override
  void didChangeDependencies() {
    listButtons = <CreateQRCodeItemModel>[
      CreateQRCodeItemModel(
        icon: const Icon(Icons.text_snippet),
        text: AppLocalizations.of(context)!.createQRCodeMenuText,
        typeQRCode: 'text',
        color: Colors.lightBlue,
      ),
      CreateQRCodeItemModel(
        icon: const Icon(Icons.wifi),
        text: AppLocalizations.of(context)!.createQRCodeMenuWifi,
        typeQRCode: 'wifi',
        color: Colors.redAccent,
      ),
      CreateQRCodeItemModel(
        icon: const Icon(Icons.link),
        text: AppLocalizations.of(context)!.createQRCodeMenuLink,
        typeQRCode: 'link',
        color: Colors.grey,
      ),
      CreateQRCodeItemModel(
        icon: const Icon(Icons.contact_page),
        text: AppLocalizations.of(context)!.createQRCodeMenuContact,
        typeQRCode: 'contact',
        color: Colors.orange,
      ),
      CreateQRCodeItemModel(
        icon: const Icon(FontAwesomeIcons.github),
        text: AppLocalizations.of(context)!.createQRCodeMenuGithub,
        typeQRCode: 'github',
        color: const Color(0xff2B2D30),
      ),
      CreateQRCodeItemModel(
        icon: const Icon(FontAwesomeIcons.whatsapp),
        text: AppLocalizations.of(context)!.createQRCodeMenuWhatsapp,
        typeQRCode: 'whatsapp',
        color: const Color(0xff30DD50),
      ),
      CreateQRCodeItemModel(
        icon: const Icon(FontAwesomeIcons.instagram),
        text: AppLocalizations.of(context)!.createQRCodeMenuInstagram,
        typeQRCode: 'instagram',
        color: const Color(0xffD23F98),
      ),
      CreateQRCodeItemModel(
        icon: const Icon(FontAwesomeIcons.tiktok),
        text: AppLocalizations.of(context)!.createQRCodeMenuTiktok,
        typeQRCode: 'tiktok',
        color: const Color(0xff010101),
      ),
      CreateQRCodeItemModel(
        icon: const Icon(FontAwesomeIcons.facebook),
        text: AppLocalizations.of(context)!.createQRCodeMenuFacebook,
        typeQRCode: 'facebook',
        color: const Color(0xff3b5998),
      ),
      CreateQRCodeItemModel(
        icon: const ImageIcon(
          AssetImage('assets/icons/onlyfans.png'),
          size: 32,
        ),
        text: AppLocalizations.of(context)!.createQRCodeMenuOnlyfans,
        typeQRCode: 'onlyfans',
        color: const Color(0xff00aaea),
      ),
      CreateQRCodeItemModel(
        icon: const Icon(FontAwesomeIcons.youtube),
        text: AppLocalizations.of(context)!.createQRCodeMenuYoutube,
        typeQRCode: 'youtube',
        color: Colors.red,
      ),
      CreateQRCodeItemModel(
        icon: const Icon(FontAwesomeIcons.twitter),
        text: AppLocalizations.of(context)!.createQRCodeMenuTwitter,
        typeQRCode: 'twitter',
        color: const Color(0xff1DA1F2),
      ),
      CreateQRCodeItemModel(
        icon: const Icon(FontAwesomeIcons.twitch),
        text: AppLocalizations.of(context)!.createQRCodeMenuTwitch,
        typeQRCode: 'twitch',
        color: const Color(0xff9146FF),
      ),
      CreateQRCodeItemModel(
        icon: const Icon(FontAwesomeIcons.reddit),
        text: AppLocalizations.of(context)!.createQRCodeMenuReddit,
        typeQRCode: 'reddit',
        color: const Color(0xffFF4500),
      ),
    ];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: listButtons.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (context, index) => CreateQRCodeItemMenu(
        qrcode: listButtons[index],
      ),
    );
  }
}
