import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard(
      {super.key, this.isSelected = false, required this.image});
  final bool isSelected;
  final String image;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      duration: const Duration(milliseconds: 300),
      width: 90,
      height: 62,
      decoration: ShapeDecoration(
        color: Colors.white,
        shadows: [
          BoxShadow(
            blurRadius: 4,
            color: isSelected ? const Color(0xFF34A853) : Colors.white,
            offset: const Offset(0, 0),
            spreadRadius: 0,
          )
        ],
        shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.5,
              color: isSelected ? const Color(0xFF34A853) : Colors.grey,
            ),
            borderRadius: BorderRadius.circular(15)),
      ),
      child: Center(child: SvgPicture.asset(image)),
    );
  }
}
