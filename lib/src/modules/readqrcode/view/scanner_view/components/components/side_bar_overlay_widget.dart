import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Container(
      height: _size.height,
      width: _size.width * 0.2,
      color: Colors.black.withAlpha(100),
    );
  }
}
