import 'package:flutter/material.dart';
import 'package:payment_app/feature/checkout/view/widgets/custom_check_icon.dart';
import 'package:payment_app/feature/checkout/view/widgets/custom_dashed_line.dart';
import 'package:payment_app/feature/checkout/view/widgets/thank_you_card.dart';

class ThankYouBody extends StatelessWidget {
  const ThankYouBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const ThankYouCard(),
            Positioned(
              bottom: MediaQuery.sizeOf(context).height / 5 + 20,
              right: 25,
              left: 25,
              child: const CustomDashedLine(),
            ),
            Positioned(
              left: -20,
              bottom: MediaQuery.sizeOf(context).height / 5,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              ),
            ),
            Positioned(
              right: -20,
              bottom: MediaQuery.sizeOf(context).height / 5,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              ),
            ),
            const Positioned(
              left: 0,
              right: 0,
              top: -50,
              child: CustomCheckIcon(),
            ),
          ],
        ),
      ),
    );
  }
}
