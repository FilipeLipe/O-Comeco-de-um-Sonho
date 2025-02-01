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
            margin: const EdgeInsets.only(top: 50),
            padding: const EdgeInsets.only(top: 60, bottom: 16, left: 16, right: 16),
            decoration: BoxDecoration(
              color: achieved ? Colors.tealAccent : Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(imagePath),
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
