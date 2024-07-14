import 'package:flutter/material.dart';
import 'package:payment_app/feature/checkout/view/widgets/custom_button_bloc_consumer.dart';
import 'package:payment_app/feature/checkout/view/widgets/payment_method_list.dart';

class PaymentMethodsBootomSheet extends StatefulWidget {
  const PaymentMethodsBootomSheet({super.key});

  @override
  State<PaymentMethodsBootomSheet> createState() =>
      _PaymentMethodsBootomSheetState();
}

class _PaymentMethodsBootomSheetState extends State<PaymentMethodsBootomSheet> {
  bool isPaypal = false;

  updatePaymentMethod({required int index}) {
    if (index == 0) {
      isPaypal = false;
    } else {
      isPaypal = true;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 16,
          ),
          PaymentMethodList(
            updatePaymentMethod: updatePaymentMethod,
          ),
          const SizedBox(
            height: 32,
          ),
          CustomButtonBlocConsumer(
            isPaypal: isPaypal,
          ),
        ],
      ),
    );
  }
}
