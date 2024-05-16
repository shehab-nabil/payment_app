import 'package:flutter/material.dart';

class PaymentDetailsViewBody extends StatelessWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 80,
          width: 110,
          child: Card(
            color: Colors.white,
            shape: Border.all(color: const Color(0xFF34A853)),
            margin: const EdgeInsets.all(10),
            // decoration: BoxDecoration(
            //     border: Border.all(
            //       color: const Color(0xFF34A853),
            //     ),
            //     borderRadius: BorderRadius.circular(15)),
          ),
        ),
      ],
    );
  }
}
