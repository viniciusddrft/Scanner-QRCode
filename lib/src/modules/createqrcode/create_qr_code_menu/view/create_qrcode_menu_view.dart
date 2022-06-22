import 'package:flutter/material.dart';

import '../controller/create_qr_code_menu_controller.dart';

import 'components/create_qrcode_menu_item.dart';

class CreateQRCodeMenu extends StatelessWidget {
  const CreateQRCodeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return GridView.builder(
      itemCount:
          CreateQrcodeMenuController.allOptionsQRCodeCreate(context, size)
              .length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (context, index) => CreateQRCodeItemMenu(
        typeQRCode: CreateQrcodeMenuController.allOptionsQRCodeCreate(
            context, size)[index]['typeQRCode'],
        icon: CreateQrcodeMenuController.allOptionsQRCodeCreate(
            context, size)[index]['icon'],
        text: CreateQrcodeMenuController.allOptionsQRCodeCreate(
            context, size)[index]['text'],
        color: CreateQrcodeMenuController.allOptionsQRCodeCreate(
            context, size)[index]['color'],
      ),
    );
  }
}
