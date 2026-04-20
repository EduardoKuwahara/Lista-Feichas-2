import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: ListaComprasApp()));

class ListaComprasApp extends StatefulWidget {
  const ListaComprasApp({super.key});

  @override
  State<ListaComprasApp> createState() => _ListaComprasAppState();
}

class _ListaComprasAppState extends State<ListaComprasApp> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _itens = [];

  void _adicionarItem() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _itens.add({'nome': _controller.text, 'comprado': false});
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Compras')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(child: TextField(controller: _controller, decoration: const InputDecoration(labelText: 'Novo item'))),
                IconButton(icon: const Icon(Icons.add), onPressed: _adicionarItem),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _itens.length,
              itemBuilder: (context, index) {
                final item = _itens[index];
                return ListTile(
                  leading: Checkbox(
                    value: item['comprado'],
                    onChanged: (val) => setState(() => item['comprado'] = val),
                  ),
                  title: Text(item['nome'], style: TextStyle(decoration: item['comprado'] ? TextDecoration.lineThrough : null)),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => setState(() => _itens.removeAt(index)),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}