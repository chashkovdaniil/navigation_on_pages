import 'package:flutter/material.dart';
import 'package:skeleton_app/src/domain/auth_manager.dart';
import 'package:skeleton_app/src/ui/pages_manager.dart';

import 'src/ui/managers.dart';

void main() async {
  runApp(const MyApp());
}

final stateManager = PagesRouterDelegate();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Managers(
      AuthManager(stateManager: stateManager),
      child: MaterialApp(
        home: PageManager(
          stateManager,
          child: const MainScreen(),
        ),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Router(
      routerDelegate: stateManager,
    );
  }
}
