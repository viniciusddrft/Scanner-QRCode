import 'package:flutter/material.dart';

class TopAndBottonBar extends StatelessWidget {
  const TopAndBottonBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Container(
      height: _size.height * 0.3333333,
      color: Colors.black.withAlpha(100),
    );
  }
}
