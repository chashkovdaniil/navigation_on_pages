import 'package:flutter/material.dart';

/// Во флаттере нет пэйджи для диалога, создаем свою
class DialogPage extends Page {
  final Widget child;

  const DialogPage(this.child);

  @override
  Route createRoute(BuildContext context) {
    return DialogRoute(
      context: context,
      builder: (context) => child,
      barrierDismissible: false,
      settings: this,
    );
  }
}
