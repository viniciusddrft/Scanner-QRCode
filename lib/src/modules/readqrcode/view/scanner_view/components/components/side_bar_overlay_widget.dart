import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width / 5,
      color: Colors.black.withAlpha(100),
    );
  }
}
