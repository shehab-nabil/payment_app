import 'package:flutter/material.dart';
import 'package:payment_app/feature/checkout/view/widgets/order_info_item.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Image.asset('assets/images/cart.png'),
        const SizedBox(
          height: 10,
        ),
        const OrderInfoItem(
          title: 'Order subtotal',
          price: '42.7',
        )
      ],
    );
  }
}
