import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';

class ConquistaFlipWidget extends StatefulWidget {
  final String frontImagePath;
  final String backImagePath;
  final bool isAtivo;

  const ConquistaFlipWidget({
    Key? key,
    required this.isAtivo,
    required this.frontImagePath,
    required this.backImagePath,
  }) : super(key: key);

  @override
  ConquistaFlipWidgetState createState() => ConquistaFlipWidgetState();
}

class ConquistaFlipWidgetState extends State<ConquistaFlipWidget>
    with TickerProviderStateMixin {
  late AnimationController _flipController;
  late Animation<double> _flipAnimation;

  late AnimationController _explosionController;
  late Animation<double> _explosionAnimation;

  @override
  void initState() {
    super.initState();
    _flipController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _flipAnimation = Tween<double>(begin: 0, end: 6 * pi).animate(
      CurvedAnimation(
        parent: _flipController,
        curve: Curves.easeInOut,
      ),
    );

    _explosionController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _explosionAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween<double>(begin: 0, end: 0.5), weight: 100),
      TweenSequenceItem(tween: Tween<double>(begin: 1, end: 0), weight: 50),
    ]).animate(
      CurvedAnimation(
        parent: _explosionController,
        curve: Curves.easeOut,
      ),
    );

    _flipController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {});
        _explosionController.forward(from: 0);
      }
    });
  }

  @override
  void dispose() {
    _flipController.dispose();
    _explosionController.dispose();
    super.dispose();
  }

  void startFlip() {
    _flipController.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedBuilder(
                animation: _explosionAnimation,
                builder: (context, child) {
                  double scale = 1 + (_explosionAnimation.value * 0.1);
                  double opacity = _explosionAnimation.value;
                  return Transform.scale(
                    scale: scale,
                    child: Opacity(
                      opacity: opacity,
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.teal.withOpacity(0.05),
                        ),
                      ),
                    ),
                  );

                },
              ),
              AnimatedBuilder(
                animation: _flipAnimation,
                builder: (context, child) {
                  bool showFront;
                  if (_flipController.status == AnimationStatus.completed || !widget.isAtivo) {
                    showFront = false;
                  } else {
                    double angle = _flipAnimation.value % (2 * pi);
                    showFront = angle <= pi;
                  }
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(_flipAnimation.value),
                    child: CircleAvatar(
                      radius: 150,
                      backgroundColor: Colors.transparent,
                      backgroundImage: FileImage(File(showFront ? widget.frontImagePath : widget.backImagePath))
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
