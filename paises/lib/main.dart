import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: PaisesApp()));

class PaisesApp extends StatefulWidget {
  const PaisesApp({super.key});

  @override
  State<PaisesApp> createState() => _PaisesAppState();
}

class _PaisesAppState extends State<PaisesApp> {
  final List<Map<String, String>> _dados = [
    {'pais': 'Brasil', 'capital': 'Brasília'},
    {'pais': 'Argentina', 'capital': 'Buenos Aires'},
    {'pais': 'Japão', 'capital': 'Tóquio'},
    {'pais': 'França', 'capital': 'Paris'}
  ];
  String _capitalSelecionada = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Países e Capitais')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Autocomplete<Map<String, String>>(
              displayStringForOption: (option) => option['pais']!,
              optionsBuilder: (TextEditingValue textValue) {
                if (textValue.text.isEmpty) return const Iterable<Map<String, String>>.empty();
                return _dados.where((d) => d['pais']!.toLowerCase().contains(textValue.text.toLowerCase()));
              },
              onSelected: (selection) => setState(() => _capitalSelecionada = selection['capital']!),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: TextEditingController(text: _capitalSelecionada),
              decoration: const InputDecoration(labelText: 'Capital', border: OutlineInputBorder()),
              readOnly: true,
            ),
          ],
        ),
      ),
    );
  }
}