import 'package:flutter/material.dart';

class AnimatedPageRouteBuilderScale extends PageRouteBuilder {
  final Widget route;
  final Duration duration;
  final Curve curve;

  AnimatedPageRouteBuilderScale(
      {required this.route, required this.duration, required this.curve})
      : super(
          transitionDuration: duration,
          reverseTransitionDuration: duration,
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return route;
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            animation = CurvedAnimation(parent: animation, curve: curve);
            return ScaleTransition(
                alignment: Alignment.center, scale: animation, child: child);
          },
        );
}
