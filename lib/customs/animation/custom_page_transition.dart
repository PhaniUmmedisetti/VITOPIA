import 'package:flutter/material.dart'
    show
        Alignment,
        CurvedAnimation,
        Curves,
        PageRouteBuilder,
        ScaleTransition,
        Widget;

class MyCustomAnimatedRoute extends PageRouteBuilder {
  final Widget enterWidget;

  MyCustomAnimatedRoute({required this.enterWidget})
      : super(
          opaque: false,
          pageBuilder: (context, animation, secondaryAnimation) => enterWidget,
          transitionDuration: Duration(milliseconds: 1000),
          reverseTransitionDuration: Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            animation = CurvedAnimation(
                parent: animation,
                curve: Curves.fastLinearToSlowEaseIn,
                reverseCurve: Curves.fastOutSlowIn);
            return ScaleTransition(
                alignment: Alignment(0.0, 0.69),
                scale: animation,
                child: child);
          },
        );
}
