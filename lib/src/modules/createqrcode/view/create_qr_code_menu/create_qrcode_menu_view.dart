import 'package:flutter/material.dart';
import 'package:scannerqrcode/src/modules/createqrcode/controller/create_qr_code_menu/create_qrcode_menu_controller.dart';
import 'package:scannerqrcode/src/modules/createqrcode/view/create_qr_code_menu/components/create_qrcode_menu_item.dart';

class CreateQRCodeMenu extends StatelessWidget {
  const CreateQRCodeMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return SizedBox(
      height: _size.height,
      width: _size.width,
      child: GridView.builder(
        itemCount: MenuItens.allOptionsQRCodeCreate(context).length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) => CreateQRCodeItemMenu(
          typeQRCode: MenuItens.allOptionsQRCodeCreate(context)[index]
              ['typeQRCode'],
          icon: MenuItens.allOptionsQRCodeCreate(context)[index]['icon'],
          text: MenuItens.allOptionsQRCodeCreate(context)[index]['text'],
          color: MenuItens.allOptionsQRCodeCreate(context)[index]['color'],
        ),
      ),
    );
  }
}
