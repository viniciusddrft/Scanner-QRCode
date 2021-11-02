import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class CenterOfScreen extends StatefulWidget {
  const CenterOfScreen();

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
    if (_y <= 409) {
      _y += _speedMove;
    }
    if (_y >= 409) {
      _speedMove = -_speedMove;
      _y += _speedMove;
    }
    if (_y <= 0) {
      _speedMove = _speedMove.toUnsigned(2);
    }
  }

  @override
  Widget build(BuildContext context) {
    _animeRedLine();
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: Column(
        children: [
          Transform.translate(
            offset: Offset(0, _y),
            child: Container(
              height: 1,
              width: MediaQuery.of(context).size.width / 1.6669,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
