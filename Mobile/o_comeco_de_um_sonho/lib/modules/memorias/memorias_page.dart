// lib/modules/memorias/memorias_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/Memorias.dart';

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
