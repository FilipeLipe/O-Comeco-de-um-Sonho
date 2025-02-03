import 'dart:math';
import 'package:flutter/material.dart';

class ConquistaFlipWidget extends StatefulWidget {
  final String imagemPretoeBrancoPath;
  final String imagemColoridaPath;

  const ConquistaFlipWidget({
    Key? key,
    required this.imagemPretoeBrancoPath,
    required this.imagemColoridaPath,
  }) : super(key: key);

  @override
  ConquistaFlipWidgetState  createState() => ConquistaFlipWidgetState ();
}

class ConquistaFlipWidgetState extends State<ConquistaFlipWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animacao;
  bool showStar = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _animacao = Tween<double>(begin: 0, end: pi).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          showStar = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  startFlip() {
    setState(() {
      showStar = false;
    });
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: AnimatedBuilder(
            animation: _animacao,
            builder: (context, child) {
              // se o valor da rotação for menor ou igual a 90° (pi/2), mostra o lado preto e branco
              bool showFront = _animacao.value <= (pi / 2);

              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(_animacao.value),
                child: CircleAvatar(
                  radius: 150,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage(
                    showFront ? widget.imagemPretoeBrancoPath : widget.imagemColoridaPath,
                  ),
                ),
              );
            },
          ),
        ),
        if (showStar)
          const Icon(
            Icons.star,
            size: 50,
            color: Colors.yellowAccent,
          ),
      ],
    );
  }
}
