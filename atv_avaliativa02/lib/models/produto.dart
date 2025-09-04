import 'package:flutter/material.dart';

class Produto {
  final String nome;
  final double valor;
  final String urlImagem;
  final String descricao;

  Produto({
    required this.nome,
    required this.valor,
    required this.urlImagem,
    required this.descricao,
  });
}

List<Produto> produtosCadastrados = [];

class Store extends InheritedWidget {
  final List<Produto> produtos;
  final Map<Produto, int> carrinho;

  Store({super.key, required Widget child, List<Produto>? initial})
    : produtos =
          initial ??
          [
            Produto(
              nome: 'Apple iPhone 16',
              descricao:
                  'Apple iPhone 16 com performance avançada e câmera de última geração.',
              valor: 16000,
              urlImagem: '',
            ),
          ],
      carrinho = {},
      super(child: child);

  static Store of(BuildContext context) {
    final s = context.dependOnInheritedWidgetOfExactType<Store>();
    assert(s != null, 'Store não encontrada no contexto');
    return s!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
