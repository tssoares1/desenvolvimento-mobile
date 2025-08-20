import 'dart:math';

import 'package:aulatres/main.dart';
import 'package:flutter/material.dart';

class TelaDois extends StatefulWidget {
  const TelaDois({super.key});

  @override
  State<TelaDois> createState() => _TelaDoisState();
}

class _TelaDoisState extends State<TelaDois> {
  var imagesGame = [
    'images/pedra.png',
    'images/papel.png',
    'images/tesoura.png',
  ];
  Random random = Random();
  var situation = [
    'images/icons8-vitoria-48.png',
    'images/icons8-perder-48.png',
    'images/icons8-aperto-de-maos-100.png',
  ];

  String resultadoTexto = "";
  String resultadoImagem = "";

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final userChoice = args['userChoice'];
    int cpuChoice = Random().nextInt(3);

    if (userChoice == cpuChoice) {
      resultadoTexto = "Empate!";
      resultadoImagem = situation[2];
    } else if ((userChoice == 0 && cpuChoice == 2) || // Pedra ganha da tesoura
        (userChoice == 1 && cpuChoice == 0) || // Papel ganha da pedra
        (userChoice == 2 && cpuChoice == 1)) // Tesoura ganha do papel
    {
      resultadoTexto = "Você Venceu!";
      resultadoImagem = situation[0];
    } else {
      resultadoTexto = "Você Perdeu!";
      resultadoImagem = situation[1];
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'Pedra, Papel, Tesoura',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                GestureDetector(
                  child: Image.asset(
                    imagesGame[cpuChoice],
                    width: 100,
                    height: 100,
                  ),
                ),
                const Text(
                  'Escolha do APP',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  child: Image.asset(
                    imagesGame[userChoice],
                    width: 100,
                    height: 100,
                  ),
                ),
                const Text(
                  'Sua escolha',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  child: Image.asset(resultadoImagem, width: 100, height: 100),
                ),
                Text(
                  resultadoTexto,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () => {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const MyHomePage(title: 'Pedra, Papel, Tesoura'),
                  ),
                ),
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6), // bordas arredondadas
                ),
                textStyle: TextStyle(fontSize: 20),
              ),
              child: Text("Jogar novamente"),
            ),
          ],
        ),
      ),
    );
  }
}
