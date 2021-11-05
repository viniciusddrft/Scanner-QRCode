import 'package:flutter/material.dart';
import 'package:scannerqrcode/src/modules/createqrcode/controller/create_qr_code_menu/create_qrcode_menu_controller.dart';
import 'package:scannerqrcode/src/modules/createqrcode/view/create_qr_code_menu/components/create_qrcode_menu_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateQRCodeMenu extends StatelessWidget {
  const CreateQRCodeMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GridView.builder(
        itemCount: MenuItens.allOptionsQRCodeCreate.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10.sp,
          mainAxisSpacing: 22.sp,
        ),
        itemBuilder: (context, index) => CreateQRCodeItemMenu(
          typeQRCode: MenuItens.allOptionsQRCodeCreate[index]['typeQRCode'],
          icon: MenuItens.allOptionsQRCodeCreate[index]['icon'],
          text: MenuItens.allOptionsQRCodeCreate[index]['text'],
          color: MenuItens.allOptionsQRCodeCreate[index]['color'],
        ),
      ),
    );
  }
}
