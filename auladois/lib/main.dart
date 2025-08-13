import 'package:auladois/telaDois.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JokenPoh',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: const MyHomePage(title: 'Pedra, Papel, Tesoura'),
      home: const TelaDois(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Center(
        // Garante centralização vertical e horizontal
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround, // Mantém no centro
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                GestureDetector(
                  child: Image.asset(
                    "images/padrao.png",
                    width: 100,
                    height: 100,
                  ),
                ),
                Text(
                  'Escolha do APP (Aleatório)',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            Column(
              children: [
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 20,
                  runSpacing: 10,
                  children: [
                    GestureDetector(
                      child: Image.asset(
                        "images/pedra.png",
                        width: 100,
                        height: 100,
                      ),
                    ),
                    GestureDetector(
                      child: Image.asset(
                        "images/papel.png",
                        width: 100,
                        height: 100,
                      ),
                    ),
                    GestureDetector(
                      child: Image.asset(
                        "images/tesoura.png",
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Escolha do usuário',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
