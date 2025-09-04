import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                "https://avatars.githubusercontent.com/u/124599?v=4",
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text("Cadastrar novo produto"),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            const Spacer(),
            ListTile(
              leading: const Icon(Icons.exit_to_app, color: Colors.red),
              title: const Text("Sair", style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pop(context); // fecha o Drawer
              },
            ),
          ],
        ),
      ),
    );
  }
}
