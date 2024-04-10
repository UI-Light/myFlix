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
        image: const DecorationImage(
          image: AssetImage('asset/image_placeholder.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
