import 'dart:convert';

import 'package:aulaquatro/profile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HTTPs',

      // home: const MyHomePage(title: 'Pedra, Papel, Tesoura'),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => const MyHomePage(),
        '/segunda': (BuildContext context) => const ProfilePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controlleID = TextEditingController();

  int id = 0;
  String name = "";
  String email = "";
  String avatarUrl = "";
  bool isLoading = false;

  String status = "";

  void alterarTela(String name, String email, String avatarUrl) {
    Navigator.pushNamed(
      context,
      '/segunda',
      arguments: {'name': name, 'email': email, 'avatarUrl': avatarUrl},
    );
  }

  void chamarAPI() async {
    setState(() {
      isLoading = true;
    });
    var url = Uri.parse('https://reqres.in/api/users/${_controlleID.text}');
    var resposta = await http.get(
      url,
      headers: {"x-api-key": "reqres-free-v1"},
    );
    var responseDecode = jsonDecode(utf8.decode(resposta.bodyBytes)) as Map;

    if (responseDecode["data"] == null) {
      setState(() {
        isLoading = false;
        status = "Usuário não encontrado";
      });
      return; // encerra aqui se não achou
    }

    setState(() {
      id = responseDecode["data"]["id"];
      name =
          responseDecode["data"]["first_name"] +
          responseDecode["data"]["last_name"];
      email = responseDecode["data"]["email"];
      avatarUrl = responseDecode["data"]["avatar"];
      isLoading = false;
    });

    alterarTela(name, email, avatarUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Garante centralização vertical e horizontal
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround, // Mantém no centro
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  const Text("Pesquisar Usuários"),
                  const SizedBox(height: 20),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: _controlleID,
                    decoration: const InputDecoration(
                      hintText: "Informe um ID de 1 a 12",
                      filled: true,
                      labelText: "ID",
                    ),
                    enabled: !isLoading,
                  ),
                  const SizedBox(height: 30),
                  Text(status),
                  ElevatedButton(
                    onPressed: isLoading ? null : chamarAPI,
                    child: isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text("Pesquisar"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
