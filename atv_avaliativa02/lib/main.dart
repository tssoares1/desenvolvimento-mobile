import 'package:atv_avaliativa02/models/produto.dart';
import 'package:atv_avaliativa02/quarta.dart';
import 'package:atv_avaliativa02/quinta.dart';
import 'package:atv_avaliativa02/segunda.dart';
import 'package:atv_avaliativa02/sexta.dart';
import 'package:atv_avaliativa02/terceira.dart';
import 'package:atv_avaliativa02/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Store(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => const MyHomePage(),
        '/segunda': (BuildContext context) => const SegundaTela(),
        '/terceira': (BuildContext context) => const TerceiraTela(),
        '/quarta': (BuildContext context) => const QuartaTela(),
        '/quinta': (BuildContext context) => const QuintaTela(),
        '/sexta': (BuildContext context) => const SextaTela(),
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
  final TextEditingController _controllerValor = TextEditingController();
  final TextEditingController _controllerUrlImagem = TextEditingController();
  final TextEditingController _controllerDescricao = TextEditingController();

  void changeScreen(String route) {
    Navigator.pushNamed(context, route);
  }

  void clearValues() {
    _controllerName.clear();
    _controllerValor.clear();
    _controllerUrlImagem.clear();
    _controllerDescricao.clear();
  }

  void save() {
    if (_controllerName.text.isEmpty || _controllerValor.text.isEmpty) return;
    final produto = Produto(
      nome: _controllerName.text,
      valor: double.tryParse(_controllerValor.text) ?? 0,
      urlImagem: _controllerUrlImagem.text,
      descricao: _controllerDescricao.text,
    );

    produtosCadastrados.add(produto);

    Navigator.pushNamed(context, "/segunda", arguments: produto);

    clearValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.grey),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      hintText: "Fone de Ouvido",
                      filled: true,
                      labelText: "Nome",
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: _controllerValor,
                    decoration: const InputDecoration(
                      hintText: "100",
                      filled: true,
                      labelText: "Valor",
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    keyboardType: TextInputType.text,
                    controller: _controllerUrlImagem,
                    decoration: const InputDecoration(
                      hintText: "https://acme.com/sample.png",
                      filled: true,
                      labelText: "URL",
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    keyboardType: TextInputType.text,
                    controller: _controllerDescricao,
                    decoration: const InputDecoration(
                      hintText: "Sample description here",
                      filled: true,
                      labelText: "Descricao",
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
                        child: const Text("Confirmar"),
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
