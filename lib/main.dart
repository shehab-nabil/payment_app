import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_app/core/utils/api_keys.dart';
import 'package:payment_app/feature/checkout/view/my_cart.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = ApiKeys.publishableKey;
  runApp(const CheckOutApp());
}

class CheckOutApp extends StatelessWidget {
  const CheckOutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCartView(),
    );
  }
}
