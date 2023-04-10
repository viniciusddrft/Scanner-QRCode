import 'package:flutter/material.dart';

import '../controller/create_qr_code_menu_controller.dart';

import 'components/create_qrcode_menu_item.dart';

class CreateQRCodeMenu extends StatefulWidget {
  const CreateQRCodeMenu({super.key});

  @override
  State<CreateQRCodeMenu> createState() => _CreateQRCodeMenuState();
}

class _CreateQRCodeMenuState extends State<CreateQRCodeMenu> {
  final _createQrcodeMenuController = CreateQrcodeMenuController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GridView.builder(
      itemCount: _createQrcodeMenuController
          .allOptionsQRCodeCreate(context, size)
          .length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (context, index) => CreateQRCodeItemMenu(
        typeQRCode: _createQrcodeMenuController.allOptionsQRCodeCreate(
            context, size)[index]['typeQRCode'] as String,
        icon: _createQrcodeMenuController.allOptionsQRCodeCreate(
            context, size)[index]['icon'] as Icon,
        text: _createQrcodeMenuController.allOptionsQRCodeCreate(
            context, size)[index]['text'] as String,
        color: _createQrcodeMenuController.allOptionsQRCodeCreate(
            context, size)[index]['color'] as Color,
      ),
    );
  }
}
