import 'package:flutter/material.dart';

class QuintaTela extends StatelessWidget {
  const QuintaTela({super.key});

  @override
  Widget build(BuildContext context) {
    final card = Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 12),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Pix',
              style: TextStyle(
                color: Colors.black,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black87, width: 2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Center(child: Icon(Icons.qr_code, size: 120)),
          ),
          const SizedBox(height: 16),
          _QuintaBotao(texto: 'Cartão débito', cor: Colors.green),
          const SizedBox(height: 8),
          _QuintaBotao(texto: 'Cartão Crédito', cor: Colors.indigo),
          const SizedBox(height: 8),
          _QuintaBotao(texto: 'Dinheiro', cor: Colors.amber),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.green.shade700,
              ),
              onPressed: () => Navigator.pushNamed(context, '/sexta'),
              child: const Text('Pagar'),
            ),
          ),
        ],
      ),
    );

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 380),
        child: card,
      ),
    );
  }
}

class _QuintaBotao extends StatelessWidget {
  final String texto;
  final Color cor;
  const _QuintaBotao({required this.texto, required this.cor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: cor),
          foregroundColor: cor,
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        onPressed: () {},
        child: Text(texto),
      ),
    );
  }
}
