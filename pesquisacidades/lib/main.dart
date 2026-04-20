import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: CidadesApp()));

class CidadesApp extends StatefulWidget {
  const CidadesApp({super.key});

  @override
  State<CidadesApp> createState() => _CidadesAppState();
}

class _CidadesAppState extends State<CidadesApp> {
  final List<String> _cidades = ['São Paulo', 'Rio de Janeiro', 'Belo Horizonte', 'Curitiba', 'Salvador', 'Fortaleza', 'Brasília'];
  String _cidadeSelecionada = 'Nenhuma cidade selecionada';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pesquisa de Cidades')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text.isEmpty) return const Iterable<String>.empty();
                return _cidades.where((cidade) => cidade.toLowerCase().contains(textEditingValue.text.toLowerCase()));
              },
              onSelected: (String selection) => setState(() => _cidadeSelecionada = selection),
            ),
            const SizedBox(height: 20),
            Text('Selecionado: $_cidadeSelecionada', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}