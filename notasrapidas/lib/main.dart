import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: NotasRapidasApp()));

class NotasRapidasApp extends StatefulWidget {
  const NotasRapidasApp({super.key});

  @override
  State<NotasRapidasApp> createState() => _NotasRapidasAppState();
}

class _NotasRapidasAppState extends State<NotasRapidasApp> {
  final _tituloCtrl = TextEditingController();
  final _conteudoCtrl = TextEditingController();
  final List<Map<String, String>> _notas = [];

  void _salvarNota() {
    setState(() {
      _notas.add({'titulo': _tituloCtrl.text, 'conteudo': _conteudoCtrl.text});
      _tituloCtrl.clear();
      _conteudoCtrl.clear();
    });
  }

  void _verNota(Map<String, String> nota) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(nota['titulo']!),
        content: Text(nota['conteudo']!),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Fechar'))],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notas Rápidas')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(controller: _tituloCtrl, decoration: const InputDecoration(labelText: 'Título')),
                TextField(controller: _conteudoCtrl, maxLines: 3, decoration: const InputDecoration(labelText: 'Conteúdo')),
                ElevatedButton(onPressed: _salvarNota, child: const Text('Salvar Nota')),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _notas.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(_notas[index]['titulo']!),
                onTap: () => _verNota(_notas[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}