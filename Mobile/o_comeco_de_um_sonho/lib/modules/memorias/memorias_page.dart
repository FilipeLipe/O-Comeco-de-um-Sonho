// lib/modules/memorias/memorias_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/Memorias.dart';
import '../../widget/CustomCard.dart';

class MemoriasPage extends StatefulWidget {
  const MemoriasPage({Key? key}) : super(key: key);

  @override
  _MemoriasPageState createState() => _MemoriasPageState();
}

class _MemoriasPageState extends State<MemoriasPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  List<Memorias> memories = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lembranças")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: memories.length,
              itemBuilder: (context, index) {
                final memory = memories[index];
                return CustomCard(
                  onTap: () {
                  },
                  child: ListTile(
                    title: Text(memory.descricao),
                    subtitle: Text(memory.data.toLocal().toString().split(' ')[0]),
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
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
