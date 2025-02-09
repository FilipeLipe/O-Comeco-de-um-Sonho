import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:o_comeco_de_um_sonho/data/models/Conquistas.dart';

class ExperienceFieldWidget extends StatefulWidget {
  final String label;
  final String valorInicial;
  final ValueChanged<String> onSave;

  const ExperienceFieldWidget({
    Key? key,
    required this.label,
    required this.valorInicial,
    required this.onSave,
  }) : super(key: key);

  @override
  _ExperienceFieldWidgetState createState() => _ExperienceFieldWidgetState();
}

class _ExperienceFieldWidgetState extends State<ExperienceFieldWidget> {
  late bool isEditing;
  late TextEditingController _controller;
  Timer? _timer;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    isEditing = widget.valorInicial.isEmpty;
    _controller = TextEditingController(text: widget.valorInicial);

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus && isEditing) {
        _salvar();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    _focusNode.dispose();
    super.dispose();
  }

  void _onTextChanged(String value) {
    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 5), () {
      _salvar();
    });
  }

  void _salvar() {
    _timer?.cancel();
    widget.onSave(_controller.text);
    Get.snackbar("Sucesso", "Experiência salva com sucesso");
    if (_controller.text.isNotEmpty) {
      setState(() {
        isEditing = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: 8),
        isEditing
          ? TextField(
              controller: _controller,
              focusNode: _focusNode,
              maxLines: null,
              decoration: InputDecoration(
                hintText: "Digite a experiência",
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding: const EdgeInsets.all(16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
              onChanged: _onTextChanged,
            )
          : GestureDetector(
              onLongPress: () {
                setState(() {
                  isEditing = true;
                  FocusScope.of(context).requestFocus(_focusNode);
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: Text(
                  _controller.text.isEmpty
                      ? "Nenhuma experiência registrada."
                      : _controller.text,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
      ],
    );
  }
}
