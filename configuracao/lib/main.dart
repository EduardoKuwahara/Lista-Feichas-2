import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: ConfigApp()));

class ConfigApp extends StatefulWidget {
  const ConfigApp({super.key});

  @override
  State<ConfigApp> createState() => _ConfigAppState();
}

class _ConfigAppState extends State<ConfigApp> {
  String _tema = 'Claro';
  String _idioma = 'Português';
  String _usuario = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configurações')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Nome de usuário'),
              onChanged: (val) => setState(() => _usuario = val),
            ),
            const SizedBox(height: 16),
            const Text('Tema:'),
            Row(children: ['Claro', 'Escuro'].map((t) => Expanded(child: RadioListTile(title: Text(t), value: t, groupValue: _tema, onChanged: (v) => setState(() => _tema = v!)))).toList()),
            const Text('Idioma:'),
            Column(children: ['Português', 'Inglês', 'Espanhol'].map((i) => RadioListTile(title: Text(i), value: i, groupValue: _idioma, onChanged: (v) => setState(() => _idioma = v!))).toList()),
            const Divider(),
            const Text('Seleções Atuais:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Usuário: $_usuario\nTema: $_tema\nIdioma: $_idioma'),
          ],
        ),
      ),
    );
  }
}