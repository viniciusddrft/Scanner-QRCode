import 'package:flutter/material.dart';

class CreateQRCodeItemModel {
  final String text, typeQRCode;
  final Widget icon;
  final Color color;

  const CreateQRCodeItemModel(
      {required this.text,
      required this.typeQRCode,
      required this.icon,
      required this.color});
}
