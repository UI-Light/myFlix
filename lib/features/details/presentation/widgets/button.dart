import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final String text;
  final Widget content;
  final Function() onTap;
  const Button({
    super.key,
    required this.text,
    required this.content,
    required this.onTap,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 45,
        width: 120,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              widget.content,
              const SizedBox(
                width: 8,
              ),
              Text(
                widget.text,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
