import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/utils/styles.dart';
import 'package:payment_app/core/widgets/custom_button.dart';
import 'package:payment_app/feature/checkout/data/repository/checkout_repos.dart';
import 'package:payment_app/feature/checkout/manager/payment_cubit/payment_cubit.dart';
import 'package:payment_app/feature/checkout/view/widgets/order_info_item.dart';
import 'package:payment_app/feature/checkout/view/widgets/payment_methods_bootom_sheet.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(height: 15),
            Image.asset('assets/images/cart.png'),
            const SizedBox(
              height: 15,
            ),
            const OrderInfoItem(
              title: 'Order subtotal',
              price: '\$ 42.7',
            ),
            const OrderInfoItem(
              title: 'Discount',
              price: '\$ 0',
            ),
            const OrderInfoItem(
              title: 'Shipping',
              price: '\$ 8',
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(height: 20, indent: 15, endIndent: 15),
            const OrderInfoItem(
              title: 'Total',
              price: '\$ 50.97',
              style: Styles.style24,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
              onTap: () {
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) {
                //   return const PaymentDetailsView();
                // }));
                showModalBottomSheet(
                    backgroundColor: Colors.white,
                    context: context,
                    builder: (context) {
                      return BlocProvider(
                        create: (context) =>
                            PaymentCubit(CheckoutRepositoryImpl()),
                        child: const PaymentMethodsBootomSheet(),
                      );
                    });
              },
              text: 'Complete Payment',
            )
          ],
        ),
      ),
    );
  }
}
