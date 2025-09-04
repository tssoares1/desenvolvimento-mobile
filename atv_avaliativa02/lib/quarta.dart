import 'package:atv_avaliativa02/models/produto.dart';
import 'package:flutter/material.dart';

class QuartaTela extends StatefulWidget {
  const QuartaTela({super.key});
  @override
  State<QuartaTela> createState() => _QuartaTelaState();
}

class _QuartaTelaState extends State<QuartaTela> {
  Widget _img(Produto p) {
    if (p.urlImagem.isNotEmpty) {
      return Image.network(p.urlImagem, fit: BoxFit.cover);
    }
    return Image.asset('assets/images/placeholder.png', fit: BoxFit.cover);
  }

  @override
  Widget build(BuildContext context) {
    final store = Store.of(context);
    final itens = store.carrinho.entries.toList();

    double total = 0;
    for (final e in itens) {
      total += e.key.valor * e.value;
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Carrinho")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if (itens.isEmpty)
              const Expanded(
                child: Center(
                  child: Text(
                    'Carrinho vazio',
                    style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              )
            else
              Expanded(
                child: ListView.separated(
                  itemCount: itens.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (ctx, i) {
                    final prod = itens[i].key;
                    final qty = itens[i].value;
                    return ListTile(
                      leading: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: _img(prod),
                      ),
                      title: Text(prod.nome),
                      subtitle: Text(
                        'R\$ ${prod.valor.toStringAsFixed(2).replaceAll('.', ',')}',
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              final q = (store.carrinho[prod] ?? 0) - 1;
                              if (q <= 0) {
                                store.carrinho.remove(prod);
                              } else {
                                store.carrinho[prod] = q;
                              }
                              setState(() {});
                            },
                          ),
                          Text('$qty'),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              store.carrinho[prod] =
                                  (store.carrinho[prod] ?? 0) + 1;
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Total: R\$ ${total.toStringAsFixed(2).replaceAll('.', ',')}',
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.green.shade700,
                  ),
                  onPressed: itens.isEmpty
                      ? null
                      : () => Navigator.pushNamed(context, '/quinta'),
                  child: const Text('Confirmar'),
                ),
                const SizedBox(width: 12),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                    side: const BorderSide(color: Colors.red),
                  ),
                  onPressed: () {
                    store.carrinho.clear();
                    setState(() {});
                  },
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
