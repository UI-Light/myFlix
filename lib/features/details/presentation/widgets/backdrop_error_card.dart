import 'package:flutter/material.dart';

class BackdropErrorCard extends StatelessWidget {
  const BackdropErrorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey[900],
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
