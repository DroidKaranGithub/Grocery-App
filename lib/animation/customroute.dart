import 'package:flutter/material.dart';

class CustomePageRoute extends PageRouteBuilder {
  final Widget child;

  CustomePageRoute({required this.child})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => child,
        );
}
