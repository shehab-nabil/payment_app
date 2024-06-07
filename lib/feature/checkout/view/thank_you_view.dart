import 'package:flutter/material.dart';
import 'package:payment_app/feature/checkout/view/widgets/thank_you_body.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          ThankYouBody(),
        ],
      ),
    );
  }
}
