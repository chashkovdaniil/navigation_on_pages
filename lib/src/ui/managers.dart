import 'package:flutter/material.dart';
import 'package:skeleton_app/src/domain/auth_manager.dart';

class Managers extends InheritedWidget {
  final AuthManager _authManager;

  const Managers(
    this._authManager, {
    super.key,
    required super.child,
  });

  static AuthManager authOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Managers>()!._authManager;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
