import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class CenterOfScreenQrcodeWidget extends StatefulWidget {
  const CenterOfScreenQrcodeWidget({super.key});

  @override
  State<CenterOfScreenQrcodeWidget> createState() =>
      _CenterOfScreenQrcodeWidgetState();
}

class _CenterOfScreenQrcodeWidgetState
    extends State<CenterOfScreenQrcodeWidget> {
  final ValueNotifier<double> _y = ValueNotifier<double>(0);
  int _speedMove = 2;
  late final Ticker _ticker;
  late final double sizeCenterSpaceY;

  @override
  void initState() {
    _ticker = Ticker((Duration duration) => _animeRedLine());
    _ticker.start();
    super.initState();
  }

  @override
  void dispose() {
    _y.dispose();
    _ticker.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    sizeCenterSpaceY = ((MediaQuery.of(context).size.width * 0.2) * 3);
    super.didChangeDependencies();
  }

//there is a change of sign to add or subtract without looping and thus control the fps
  void _animeRedLine() {
    if (_y.value <= sizeCenterSpaceY) {
      _y.value += _speedMove;
    }
    if (_y.value >= sizeCenterSpaceY) {
      _speedMove = -_speedMove;
      _y.value += _speedMove;
    }
    if (_y.value <= 0) {
      _speedMove = _speedMove.toUnsigned(2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _y,
      builder: (BuildContext context, double value, Widget? child) => Column(
        children: [
          Transform.translate(
            offset: Offset(0, _y.value),
            child: Container(
              height: 1,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
