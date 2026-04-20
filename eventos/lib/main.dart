import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: EventosApp()));

class EventosApp extends StatefulWidget {
  const EventosApp({super.key});

  @override
  State<EventosApp> createState() => _EventosAppState();
}

class _EventosAppState extends State<EventosApp> {
  DateTime _dataAtual = DateTime.now();
  final _nomeCtrl = TextEditingController();
  final _horaCtrl = TextEditingController();
  final List<Map<String, dynamic>> _eventos = [];

  void _salvarEvento() {
    setState(() {
      _eventos.add({'data': _dataAtual, 'nome': _nomeCtrl.text, 'hora': _horaCtrl.text});
      _nomeCtrl.clear();
      _horaCtrl.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agendamento')),
      body: Column(
        children: [
          CalendarDatePicker(
            initialDate: _dataAtual,
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
            onDateChanged: (data) => setState(() => _dataAtual = data),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(child: TextField(controller: _nomeCtrl, decoration: const InputDecoration(labelText: 'Nome do Evento'))),
                const SizedBox(width: 8),
                Expanded(child: TextField(controller: _horaCtrl, decoration: const InputDecoration(labelText: 'Hora (Ex: 14:00)'))),
                IconButton(icon: const Icon(Icons.save), onPressed: _salvarEvento)
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _eventos.length,
              itemBuilder: (context, index) {
                final e = _eventos[index];
                return ListTile(
                  title: Text(e['nome']),
                  subtitle: Text("${e['data'].day}/${e['data'].month}/${e['data'].year} às ${e['hora']}"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}