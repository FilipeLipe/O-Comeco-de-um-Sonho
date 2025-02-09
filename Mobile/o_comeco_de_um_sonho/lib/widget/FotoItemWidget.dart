import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'dart:io';
import '../data/models/Foto.dart';

class FotoItemWidget extends StatefulWidget {
  final Foto foto;
  final int index;
  final VoidCallback onDelete;
  final VoidCallback onExpand;

  const FotoItemWidget({
    Key? key,
    required this.foto,
    required this.index,
    required this.onDelete,
    required this.onExpand,
  }) : super(key: key);

  @override
  _FotoItemWidgetState createState() => _FotoItemWidgetState();
}

class _FotoItemWidgetState extends State<FotoItemWidget>
    with SingleTickerProviderStateMixin {
  bool _modoDeletar = false;

  late AnimationController _animController;
  late Animation<double> _animOpacity;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animOpacity = Tween<double>(begin: 0, end: 1).animate(_animController);
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _ativarModoDeletar() {
    setState(() {
      _modoDeletar = true;
    });
    _animController.forward();
  }

  void _cancelarModoDeletar() {
    _animController.reverse().then((_) {
      setState(() {
        _modoDeletar = false;
      });
    });
  }

  void _onTapDelete() {
    widget.onDelete();
    _cancelarModoDeletar();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_modoDeletar) {
          _cancelarModoDeletar();
        } else {
          widget.onExpand();
        }
      },
      onLongPress: _ativarModoDeletar,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: _modoDeletar ? 0.5 : 1.0,
            child: Container(
              width: 120,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: widget.foto.foto != null
                      ? MemoryImage(Uint8List.fromList(widget.foto.foto!))
                      : const AssetImage("assets/images/placeholder.png")
                  as ImageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          if (_modoDeletar)
            Center(
              child: FadeTransition(
                opacity: _animOpacity,
                child: GestureDetector(
                  onTap: _onTapDelete,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.delete,
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
