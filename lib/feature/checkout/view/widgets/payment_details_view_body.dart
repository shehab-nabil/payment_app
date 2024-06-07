import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:payment_app/core/widgets/custom_button.dart';
import 'package:payment_app/feature/checkout/view/thank_you_view.dart';
import 'package:payment_app/feature/checkout/view/widgets/custom_credit_card.dart';
import 'package:payment_app/feature/checkout/view/widgets/payment_method_list.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      const SliverToBoxAdapter(
        child: PaymentMethodList(),
      ),
      SliverToBoxAdapter(
        child: CustomCreditCard(
          formKey: formKey,
          autovalidateMode: autovalidateMode,
        ),
      ),
      SliverFillRemaining(
        hasScrollBody: false,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
            child: CustomButton(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  log('payment');
                } else {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const ThankYouView();
                  }));
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              text: 'pay ',
            ),
          ),
        ),
      )
    ]);
  }
}
