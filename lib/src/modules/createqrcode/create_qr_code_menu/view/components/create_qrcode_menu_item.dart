import 'package:flutter/material.dart';

import '../../../../../shared/models/create_qrcode_item_model.dart';

class CreateQRCodeItemMenu extends StatelessWidget {
  final CreateQRCodeItemModel qrcode;
  const CreateQRCodeItemMenu({required this.qrcode, super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(
              size.height * 0.09,
              size.height * 0.09,
            ),
            backgroundColor: qrcode.color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(360),
            ),
          ),
          onPressed: () => Navigator.pushNamed(context, '/CreateQRCode',
              arguments: <String, String>{
                'typeQRCode': qrcode.typeQRCode,
              }),
          child: Center(
            child: qrcode.icon,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.01),
          child: Text(
            qrcode.text,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        )
      ],
    );
  }
}
