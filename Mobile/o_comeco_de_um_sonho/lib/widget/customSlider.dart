import 'dart:ui';

import 'package:flutter/material.dart';

class ConquistasCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final bool achieved;
  final VoidCallback? onTap;

  const ConquistasCard({
    Key? key,
    required this.title,
    required this.imagePath,
    this.achieved = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 250, bottom: 10, left: 10, right: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  padding: const EdgeInsets.only(top: 60, bottom: 16, left: 16, right: 16),
                  decoration: BoxDecoration(
                    // Utilize uma cor com opacidade para criar o efeito "glass"
                    color: (achieved ? Colors.tealAccent : Colors.grey[300])?.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Ajuste a cor do texto conforme o efeito desejado
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: CircleAvatar(
              radius: 135,
              backgroundImage: AssetImage(imagePath),
              backgroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}