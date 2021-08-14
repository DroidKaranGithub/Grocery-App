import 'package:flutter/material.dart';

class CustomePageRoute extends PageRouteBuilder<MaterialPageRoute> {
  final Widget child;

  CustomePageRoute({required this.child})
      : super(
          transitionDuration: Duration(seconds: 1),
          reverseTransitionDuration: Duration(seconds: 1),
          pageBuilder: (context, animation, secondaryAnimation) => child,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      /** Scale Transition */
      // ScaleTransition(
      //   scale: animation,
      //   child: child,
      // );
      /** Slide Transition */
      SlideTransition(
        position: Tween<Offset>(
          begin: Offset(1, 0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
}
