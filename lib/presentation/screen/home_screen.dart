import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          style: TextButton.styleFrom(foregroundColor: Colors.green),
          child: const Text('Let me see what spring is like'),
          onPressed: () async {
            final client = Client();
            client.setEndpoint('http://localhost/v1').setProject('64674d0ef3c638e8a195').setSelfSigned();
            final account = Account(client);
            final user = await account.create(
              userId: ID.unique(),
              email: 'me@appwrite.io',
              password: 'password',
              name: 'My Name',
            );
            debugPrint('User Created :: ${user.name}');
          },
        ),
      ),
    );
  }
}
