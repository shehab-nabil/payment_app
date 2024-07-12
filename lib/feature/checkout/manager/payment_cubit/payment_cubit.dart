import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:payment_app/feature/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_app/feature/checkout/data/repository/checkout_repos.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkoutRepository) : super(PaymentInitial());
  final CheckoutRepository checkoutRepository;
  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentLoading());
    var data = await checkoutRepository.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);
    data.fold(
        (failure) => emit(PaymentFailure(errorMessage: failure.errorMessage)),
        (success) => emit(PaymentSuccess()));
  }

  @override
  void onChange(Change<PaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
