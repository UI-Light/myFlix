import 'package:flutter/material.dart';

class BackdropLoadingCard extends StatelessWidget {
  const BackdropLoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey[900],
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
