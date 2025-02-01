// lib/modules/memorias/memorias_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/Memorias.dart';
import '../../widget/customCard.dart';

class MemoriasPage extends StatefulWidget {
  const MemoriasPage({Key? key}) : super(key: key);

  @override
  _MemoriasPageState createState() => _MemoriasPageState();
}

class _MemoriasPageState extends State<MemoriasPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // Lista simulada de lembranças (substituir pela consulta no DB)
  List<Memorias> memories = [];

  @override
  void initState() {
    super.initState();
    // Carregar dados do DB
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lembranças")),
      body: Column(
        children: [
          // TableCalendario(
          //   firstDay: DateTime(2020),
          //   lastDay: DateTime(2030),
          //   focusedDay: _focusedDay,
          //   calendarioFormat: CalendarioFormat.month,
          //   selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
          //   onDaySelected: (selectedDay, focusedDay) {
          //     setState(() {
          //       _selectedDay = selectedDay;
          //       _focusedDay = focusedDay;
          //     });
          //     // Exibir detalhes ou formulário para adicionar memória
          //   },
          // ),
          Expanded(
            child: ListView.builder(
              itemCount: memories.length,
              itemBuilder: (context, index) {
                final memory = memories[index];
                return CustomCard(
                  onTap: () {
                    // Exibir detalhes da memória
                  },
                  child: ListTile(
                    title: Text(memory.description),
                    subtitle: Text(memory.date.toLocal().toString().split(' ')[0]),
                    leading: memory.imagePath != null
                        ? Image.asset(memory.imagePath!, width: 50, height: 50, fit: BoxFit.cover)
                        : const Icon(Icons.photo),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navegar para a página de adicionar nova memória
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
