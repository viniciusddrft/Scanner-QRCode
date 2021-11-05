import 'package:flutter/material.dart';

class TopAndBottonBar extends StatelessWidget {
  const TopAndBottonBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      color: Colors.black.withAlpha(100),
    );
  }
}
