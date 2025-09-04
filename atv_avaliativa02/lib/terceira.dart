import 'package:atv_avaliativa02/models/produto.dart';
import 'package:flutter/material.dart';

class TerceiraTela extends StatelessWidget {
  const TerceiraTela({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Store.of(context);
    final produto =
        ModalRoute.of(context)!.settings.arguments as Produto? ??
        store.produtos.first;

    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 360),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.08),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 84,
              height: 84,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8),
              ),
              clipBehavior: Clip.antiAlias,
            ),
            const SizedBox(height: 8),
            Text(
              produto.nome,
              style: const TextStyle(
                color: Colors.black, // força cor preta
                decoration: TextDecoration.none, // remove sublinhado
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Descricao\n${produto.descricao}',
                textAlign: TextAlign.left,
                style: const TextStyle(
                  color: Colors.black, // força cor preta
                  decoration: TextDecoration.none, // remove sublinhado
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'R\$ ${produto.valor.toStringAsFixed(2).replaceAll('.', ',')}',
              style: const TextStyle(
                color: Colors.black, // força cor preta
                decoration: TextDecoration.none, // remove sublinhado
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.green.shade700,
                  ),
                  onPressed: () {
                    // adicionar ao carrinho e ir para o carrinho
                    store.carrinho[produto] =
                        (store.carrinho[produto] ?? 0) + 1;
                    Navigator.pushNamed(context, '/quarta');
                  },
                  child: const Text('Confirmar'),
                ),
                const SizedBox(width: 12),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                    side: const BorderSide(color: Colors.red),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancelar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
