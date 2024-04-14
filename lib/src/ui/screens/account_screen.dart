import 'package:flutter/material.dart';

import '../managers.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Пример авторизации'),
        actions: [
          IconButton(
            onPressed: () {
              Managers.authOf(context).logout();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: const Center(
        child: Column(
          children: [
            Text(
              'You in account',
            ),
          ],
        ),
      ),
    );
  }
}
