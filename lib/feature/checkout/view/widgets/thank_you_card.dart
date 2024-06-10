import 'package:flutter/material.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      // height: MediaQuery.of(context).size.height / 1,
      decoration: ShapeDecoration(
        color: Colors.grey[350],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
