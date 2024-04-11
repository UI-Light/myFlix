import 'package:flutter/material.dart';

class LoadingErrorCard extends StatelessWidget {
  const LoadingErrorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 135,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[900],
      ),
      child: Center(
        child: Icon(
          Icons.image_not_supported,
          size: 60,
          color: Colors.grey[800],
        ),
      ),
    );
  }
}
