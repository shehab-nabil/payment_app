import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/styles.dart';

class OrderInfoItem extends StatelessWidget {
  final String title, price;
  final TextStyle? style;
  const OrderInfoItem(
      {super.key, required this.title, required this.price, this.style});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Text(
            title,
            style: style ?? Styles.style18,
          ),
          const Spacer(),
          Text(
            price,
            style: style ?? Styles.style18,
          )
        ],
      ),
    );
  }
}
