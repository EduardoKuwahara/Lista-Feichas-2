import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: CatalogoApp()));

class CatalogoApp extends StatelessWidget {
  const CatalogoApp({super.key});

  final List<String> eletronicos = const ['Smartphone', 'Notebook', 'Smartwatch'];
  final List<String> roupas = const ['Camiseta', 'Calça Jeans', 'Jaqueta'];
  final List<String> livros = const ['Flutter Básico', 'Clean Code', 'Dart Avançado'];

  Widget _buildList(List<String> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.shopping_bag),
        title: Text(items[index]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Catálogo'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Eletrônicos', icon: Icon(Icons.computer)),
              Tab(text: 'Roupas', icon: Icon(Icons.checkroom)),
              Tab(text: 'Livros', icon: Icon(Icons.book)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildList(eletronicos),
            _buildList(roupas),
            _buildList(livros),
          ],
        ),
      ),
    );
  }
}