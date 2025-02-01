// lib/modules/calendario/calendario_page.dart
import 'package:flutter/material.dart';
import '../../data/models/Calendario.dart';

class CalendarioPage extends StatefulWidget {
  const CalendarioPage({Key? key}) : super(key: key);

  @override
  _CalendarioPageState createState() => _CalendarioPageState();
}

class _CalendarioPageState extends State<CalendarioPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  List<Calendario> events = []; // Carregue do DB

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calendário")),
      body: Column(
        children: [
          // TableCalendario(
          //   firstDay: DateTime(2020),
          //   lastDay: DateTime(2030),
          //   focusedDay: _focusedDay,
          //   selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
          //   onDaySelected: (selectedDay, focusedDay) {
          //     setState(() {
          //       _selectedDay = selectedDay;
          //       _focusedDay = focusedDay;
          //     });
          //     // Mostrar eventos desse dia ou permitir adicionar
          //   },
          // ),
          // Exibir lista de eventos do dia selecionado
          Expanded(
            child: ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                final event = events[index];
                return ListTile(
                  title: Text(event.title),
                  subtitle: Text(event.date.toLocal().toString().split(' ')[0]),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navegar para página/formulário de adicionar evento
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
