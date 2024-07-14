import 'package:flutter/material.dart';
import 'package:payment_app/feature/checkout/view/widgets/payment_method_card.dart';

class PaymentMethodList extends StatefulWidget {
  const PaymentMethodList({super.key, required this.updatePaymentMethod});
  final Function({required int index}) updatePaymentMethod;

  @override
  State<PaymentMethodList> createState() => _PaymentMethodListState();
}

class _PaymentMethodListState extends State<PaymentMethodList> {
  final List<String> paymentMethodsItems = const [
    'assets/images/card.svg',
    'assets/images/paypal.svg'
  ];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: ListView.builder(
        itemCount: paymentMethodsItems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              selectedIndex = index;
              setState(() {});
              widget.updatePaymentMethod(index: selectedIndex);
            },
            child: PaymentMethodCard(
              isSelected: index == selectedIndex,
              image: paymentMethodsItems[index],
            ),
          );
        },
      ),
    );
  }
}
