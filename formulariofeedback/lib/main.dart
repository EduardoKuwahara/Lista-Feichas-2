import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: FeedbackApp()));

class FeedbackApp extends StatefulWidget {
  const FeedbackApp({super.key});

  @override
  State<FeedbackApp> createState() => _FeedbackAppState();
}

class _FeedbackAppState extends State<FeedbackApp> {
  final _nomeCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _comentarioCtrl = TextEditingController();
  String _avaliacao = 'Bom';

  void _enviarFeedback() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Feedback enviado com sucesso!')));
    _nomeCtrl.clear(); _emailCtrl.clear(); _comentarioCtrl.clear();
    setState(() => _avaliacao = 'Bom');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Feedback')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          TextField(controller: _nomeCtrl, decoration: const InputDecoration(labelText: 'Nome')),
          TextField(controller: _emailCtrl, decoration: const InputDecoration(labelText: 'Email')),
          const SizedBox(height: 16),
          const Text('Avalie nosso serviço:'),
          ...['Excelente', 'Bom', 'Regular', 'Ruim'].map((v) => RadioListTile<String>(
            title: Text(v), value: v, groupValue: _avaliacao, onChanged: (val) => setState(() => _avaliacao = val!),
          )),
          TextField(controller: _comentarioCtrl, maxLines: 4, decoration: const InputDecoration(labelText: 'Comentários')),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: _enviarFeedback, child: const Text('Enviar Feedback')),
        ],
      ),
    );
  }
}