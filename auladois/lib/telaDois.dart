import 'package:flutter/material.dart';

class TelaDois extends StatefulWidget {
  const TelaDois({super.key});

  @override
  State<TelaDois> createState() => _TelaDoisState();
}

class _TelaDoisState extends State<TelaDois> {
  @override
  Widget build(BuildContext context) {
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
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    GestureDetector(
                      child: Image.asset(
                        "images/papel.png",
                        width: 100,
                        height: 100,
                      ),
                    ),
                    const Text(
                      'Escolha do APP',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      child: Image.asset(
                        "images/pedra.png",
                        width: 100,
                        height: 100,
                      ),
                    ),
                    const Text(
                      'Sua escolha',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      child: Image.asset(
                        "images/icons8-perder-48.png",
                        width: 100,
                        height: 100,
                      ),
                    ),
                    const Text(
                      'Você Perdeu/Venceu',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ElevatedButton(onPressed: () => {}, child: Text("Jogar novamente")),
          ],
        ),
      ),
    );
  }
}
