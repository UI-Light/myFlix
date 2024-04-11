import 'package:flutter/material.dart';

class MovieLoadingCard extends StatelessWidget {
  const MovieLoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 135,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.grey[900]),
      child: Center(
        child: SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            strokeWidth: 3.0,
            valueColor: AlwaysStoppedAnimation(Colors.red[900]),
          ),
        ),
      ),
    );
  }
}
