import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: TarefasDiariasApp()));

class TarefasDiariasApp extends StatefulWidget {
  const TarefasDiariasApp({super.key});

  @override
  State<TarefasDiariasApp> createState() => _TarefasDiariasAppState();
}

class _TarefasDiariasAppState extends State<TarefasDiariasApp> {
  final _nomeCtrl = TextEditingController();
  final _descCtrl = TextEditingController();
  String _prioridade = 'Baixa';
  final List<Map<String, dynamic>> _tarefas = [];

  void _adicionarTarefa() {
    setState(() {
      _tarefas.add({
        'nome': _nomeCtrl.text,
        'desc': _descCtrl.text,
        'prioridade': _prioridade,
        'concluida': false,
      });
      _nomeCtrl.clear();
      _descCtrl.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tarefas Diárias')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(controller: _nomeCtrl, decoration: const InputDecoration(labelText: 'Nome da Tarefa')),
                TextField(controller: _descCtrl, decoration: const InputDecoration(labelText: 'Descrição')),
                Row(
                  children: ['Baixa', 'Média', 'Alta'].map((p) => Expanded(
                    child: RadioListTile<String>(
                      title: Text(p, style: const TextStyle(fontSize: 12)),
                      value: p,
                      groupValue: _prioridade,
                      onChanged: (val) => setState(() => _prioridade = val!),
                    ),
                  )).toList(),
                ),
                ElevatedButton(onPressed: _adicionarTarefa, child: const Text('Adicionar')),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tarefas.length,
              itemBuilder: (context, index) {
                final t = _tarefas[index];
                return CheckboxListTile(
                  title: Text('${t['nome']} (${t['prioridade']})'),
                  subtitle: Text(t['desc']),
                  value: t['concluida'],
                  onChanged: (val) => setState(() => t['concluida'] = val),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}