import 'package:flutter/material.dart';

// See: https://stackoverflow.com/a/44404763/9316144
class HeroDialogRoute<T> extends PageRoute<T> {
  bool _barrierDismissible;

  HeroDialogRoute({this.builder, bool barrierDismissible = true}) : super() {
    _barrierDismissible = barrierDismissible;
  }

  final WidgetBuilder builder;

  @override
  String get barrierLabel => "AddChallengeBarrierLabel";

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => _barrierDismissible;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get maintainState => true;

  @override
  Color get barrierColor => Colors.black54;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
      child: child,
    );
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return builder(
      context,
    );
  }
}
