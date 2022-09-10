import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class CenterOfScreenBarcodeWidget extends StatefulWidget {
  const CenterOfScreenBarcodeWidget({super.key});

  @override
  State<CenterOfScreenBarcodeWidget> createState() =>
      _CenterOfScreenBarcodeWidgetState();
}

class _CenterOfScreenBarcodeWidgetState
    extends State<CenterOfScreenBarcodeWidget> {
  late final ValueNotifier<double> _x =
      ValueNotifier<double>((MediaQuery.of(context).size.width * 0.17));
  late Ticker _ticker;
  late final double sizeCenterSpaceX;
  int _speedMove = 2;
  late final double sizeRedLine;

  @override
  void initState() {
    _ticker = Ticker((Duration duration) => _animeRedLine());
    _ticker.start();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    sizeRedLine =
        MediaQuery.of(context).size.height * 0.66666666666666666666666666666;
    sizeCenterSpaceX =
        (MediaQuery.of(context).size.width * 0.1666666666666666666666666666666);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  //there is a change of sign to add or subtract without looping and thus control the fps
  void _animeRedLine() {
    if (_x.value < sizeCenterSpaceX) {
      _x.value += _speedMove;
    }
    if (_x.value >= sizeCenterSpaceX) {
      _speedMove = -_speedMove;
      _x.value += _speedMove;
    }
    if (_x.value < -sizeCenterSpaceX) {
      _speedMove = _speedMove.toUnsigned(2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _x,
      builder: (BuildContext context, double value, Widget? child) => Column(
        children: [
          Transform.translate(
            offset: Offset(value, 0),
            child: Container(
              width: 1,
              height: sizeRedLine,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
