import 'package:atv_revisao/models/usuario.dart';
import 'package:atv_revisao/segunda.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atividade Revisão',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => const MyHomePage(),
        '/segunda': (BuildContext context) => const SegundaTela(),
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
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerTelefone = TextEditingController();
  final TextEditingController _controllerDataNascimento =
      TextEditingController();
  final TextEditingController _controllerEndereco = TextEditingController();

  void changeScreen(String route) {
    Navigator.pushNamed(context, route);
  }

  void clearValues() {
    _controllerName.clear();
    _controllerEmail.clear();
    _controllerTelefone.clear();
    _controllerDataNascimento.clear();
    _controllerEndereco.clear();
  }

  void save() {
    if (_controllerName.text.isEmpty ||
        _controllerEmail.text.isEmpty ||
        _controllerTelefone.text.isEmpty ||
        _controllerDataNascimento.text.isEmpty ||
        _controllerEndereco.text.isEmpty) {
      return;
    }

    final usuario = Usuario(
      nome: _controllerName.text,
      email: _controllerEmail.text,
      telefone: _controllerTelefone.text,
      dataNascimento: _controllerDataNascimento.text,
      endereco: _controllerEndereco.text,
    );

    Navigator.pushNamed(context, "/segunda", arguments: usuario);

    clearValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("Atividade Revisão"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                children: [
                  TextField(
                    keyboardType: TextInputType.text,
                    controller: _controllerName,
                    decoration: const InputDecoration(
                      hintText: "John Smite",
                      filled: true,
                      labelText: "Nome",
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    keyboardType: TextInputType.text,
                    controller: _controllerEmail,
                    decoration: const InputDecoration(
                      hintText: "john.doe@acme.com",
                      filled: true,
                      labelText: "Email",
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    keyboardType: TextInputType.text,
                    controller: _controllerTelefone,
                    decoration: const InputDecoration(
                      hintText: "(55) 45 9 9999-9999",
                      filled: true,
                      labelText: "Telefone",
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    keyboardType: TextInputType.text,
                    controller: _controllerDataNascimento,
                    decoration: const InputDecoration(
                      hintText: "01/01/2000",
                      filled: true,
                      labelText: "Data de Nascimento",
                    ),
                  ),
                  const SizedBox(height: 50),
                  TextField(
                    keyboardType: TextInputType.text,
                    controller: _controllerEndereco,
                    decoration: const InputDecoration(
                      hintText: "Av. Sample 101",
                      filled: true,
                      labelText: "Endereço",
                    ),
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          save();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              6,
                            ), // bordas arredondadas
                          ),
                          textStyle: TextStyle(fontSize: 16),
                        ),
                        child: const Text("Cadastrar"),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {
                          clearValues();
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                            side: const BorderSide(
                              color: Colors.red,
                            ), // bordas arredondadas
                          ),
                          textStyle: TextStyle(fontSize: 16),
                        ),
                        child: const Text("Cancelar"),
                      ),
                    ],
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
