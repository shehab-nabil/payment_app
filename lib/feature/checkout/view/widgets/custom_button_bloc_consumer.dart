import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/widgets/custom_button.dart';
import 'package:payment_app/feature/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_app/feature/checkout/manager/payment_cubit/payment_cubit.dart';
import 'package:payment_app/feature/checkout/view/thank_you_view.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) {
            return const ThankYouView();
          }));
        }

        if (state is PaymentFailure) {
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(content: Text(state.errorMessage));
          print(state.errorMessage);
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomButton(
            onTap: () {
              // if (isPaypal) {
              // var transctionsData = getTransctionsData();
              // exceutePaypalPayment(context, transctionsData);
              // } else {
              excuteStripePayment(context);
              // }
            },
            isLoading: state is PaymentLoading ? true : false,
            text: 'continue');
      },
    );
  }
}

void excuteStripePayment(BuildContext context) {
  PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
    amount: '100',
    currency: 'USD',
    customerId: 'cus_QSi1CyDyoECcLn',
  );
  BlocProvider.of<PaymentCubit>(context)
      .makePayment(paymentIntentInputModel: paymentIntentInputModel);
}
