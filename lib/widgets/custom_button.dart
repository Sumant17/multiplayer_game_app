import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const CustomButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(blurRadius: 5, spreadRadius: 0, color: Colors.blue)
      ]),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(minimumSize: Size(width, 50)),
        child: Text(text),
      ),
    );
  }
}
