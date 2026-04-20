import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: DiarioApp()));

class DiarioApp extends StatefulWidget {
  const DiarioApp({super.key});

  @override
  State<DiarioApp> createState() => _DiarioAppState();
}

class _DiarioAppState extends State<DiarioApp> {
  DateTime _dataAtual = DateTime.now();
  final Map<DateTime, String> _entradas = {};
  final _textoCtrl = TextEditingController();

  void _atualizarTexto(DateTime data) {
    final key = DateTime(data.year, data.month, data.day);
    _textoCtrl.text = _entradas[key] ?? '';
  }

  void _salvarEntrada() {
    final key = DateTime(_dataAtual.year, _dataAtual.month, _dataAtual.day);
    setState(() => _entradas[key] = _textoCtrl.text);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Salvo!')));
  }

  @override
  void initState() {
    super.initState();
    _atualizarTexto(_dataAtual);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Diário Pessoal')),
      body: Column(
        children: [
          CalendarDatePicker(
            initialDate: _dataAtual,
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
            onDateChanged: (data) {
              setState(() => _dataAtual = data);
              _atualizarTexto(data);
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Dias com registros: ${_entradas.keys.map((d) => "${d.day}/${d.month}").join(', ')}',
              style: const TextStyle(color: Colors.blue),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _textoCtrl,
                maxLines: null,
                expands: true,
                decoration: const InputDecoration(hintText: 'Escreva seu diário aqui...', border: OutlineInputBorder()),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: _salvarEntrada, child: const Text('Salvar no Diário')),
          )
        ],
      ),
    );
  }
}