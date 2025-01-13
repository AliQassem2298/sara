// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Profileinfofield extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const Profileinfofield({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.cyan,
            size: 28,
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700]),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16, color: Colors.cyan),
          ),
        ],
      ),
    );
  }
}
