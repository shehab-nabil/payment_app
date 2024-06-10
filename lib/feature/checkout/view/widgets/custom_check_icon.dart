import 'package:flutter/material.dart';

class CustomCheckIcon extends StatelessWidget {
  const CustomCheckIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundColor: Colors.grey[350],
      child: const CircleAvatar(
        radius: 42,
        backgroundColor: Color(0xFF34A853),
        child: Icon(
          Icons.check,
          color: Colors.white,
          size: 55,
        ),
      ),
    );
  }
}
