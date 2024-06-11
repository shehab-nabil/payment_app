import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/styles.dart';
import 'package:payment_app/feature/checkout/view/widgets/cart_view_body.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
        title: const Text(
          ' My Cart',
          textAlign: TextAlign.center,
          style: Styles.style25,
        ),
      ),
      body: const MyCartViewBody(),
    );
  }
}
