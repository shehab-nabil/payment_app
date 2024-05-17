import 'package:flutter/material.dart';
import 'package:payment_app/feature/checkout/view/widgets/payment_method_list.dart';

class PaymentDetailsViewBody extends StatelessWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [PaymentMethodList()],
    );
  }
}
