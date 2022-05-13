import 'package:flutter/material.dart';

class CreateQRCodeItemMenu extends StatelessWidget {
  final Color color;
  final Icon icon;
  final String text;
  final String typeQRCode;
  const CreateQRCodeItemMenu(
      {required this.icon,
      required this.text,
      required this.typeQRCode,
      required this.color,
      super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(
              size.height * 0.09,
              size.height * 0.09,
            ),
            primary: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(360),
            ),
          ),
          onPressed: () => Navigator.pushNamed(context, '/CreateQRCode',
              arguments: <String, String>{
                'typeQRCode': typeQRCode,
              }),
          child: Center(
            child: icon,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.01),
          child: Text(
            text,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        )
      ],
    );
  }
}
