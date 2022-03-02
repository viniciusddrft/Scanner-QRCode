import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class CenterOfScreen extends StatefulWidget {
  const CenterOfScreen({Key? key}) : super(key: key);

  @override
  State<CenterOfScreen> createState() => _CenterOfScreenState();
}

class _CenterOfScreenState extends State<CenterOfScreen> {
  double _y = 0;
  int _speedMove = 2;

  late Ticker _ticker;

  @override
  void initState() {
    _ticker = Ticker((Duration duration) => setState(() {}));
    _ticker.start();
    super.initState();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

//there is a change of sign to add or subtract without looping and thus control the fps
  void _animeRedLine() {
    if (_y <= 273) {
      _y += _speedMove;
    }
    if (_y >= 273) {
      _speedMove = -_speedMove;
      _y += _speedMove;
    }
    if (_y <= 0) {
      _speedMove = _speedMove.toUnsigned(2);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    _animeRedLine();
    return SizedBox(
      height: _size.height * 0.333333,
      child: Column(
        children: [
          Transform.translate(
            offset: Offset(0, _y),
            child: Container(
              height: 1,
              width: _size.width * 0.6,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
