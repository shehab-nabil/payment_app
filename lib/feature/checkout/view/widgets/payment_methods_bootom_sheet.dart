import 'package:flutter/material.dart';
import 'package:payment_app/core/widgets/custom_button.dart';
import 'package:payment_app/feature/checkout/view/widgets/payment_method_list.dart';

class PaymentMethodsBootomSheet extends StatelessWidget {
  const PaymentMethodsBootomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 16,
          ),
          PaymentMethodList(),
          SizedBox(
            height: 32,
          ),
          CustomButton(text: 'continue'),
        ],
      ),
    );
  }
}
