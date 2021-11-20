import 'package:flutter/material.dart';

class AnimatedPageRouteBuilderLeftToRight extends PageRouteBuilder {
  final Widget route;
  final Duration duration;

  AnimatedPageRouteBuilderLeftToRight(
      {required this.route, required this.duration})
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
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
}
