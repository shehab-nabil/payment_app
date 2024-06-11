import 'package:flutter/material.dart';
import 'package:payment_app/feature/checkout/view/widgets/thank_you_body.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Transform.translate(
          offset: const Offset(0, -30), child: const ThankYouBody()),
    );
  }
}
