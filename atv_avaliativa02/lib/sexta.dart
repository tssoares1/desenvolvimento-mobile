import 'package:atv_avaliativa02/models/produto.dart';
import 'package:flutter/material.dart';

class SextaTela extends StatelessWidget {
  const SextaTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Compra concluída com sucesso!',
            style: TextStyle(
              color: Colors.black,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: 220,
            child: FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.green.shade700,
              ),
              onPressed: () {
                Store.of(context).carrinho.clear();
                Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false);
              },
              child: const Text('Recomeçar'),
            ),
          ),
        ],
      ),
    );
  }
}
