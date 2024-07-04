import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_app/core/utils/api_keys.dart';
import 'package:payment_app/core/utils/api_service.dart';
import 'package:payment_app/feature/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_app/feature/checkout/data/models/payment_intent_model/payment_intent_model.dart';

class StripService {
  final ApiService apiService = ApiService();
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService
        .post(
            body: paymentIntentInputModel.toJson(),
            url: 'https://api.stripe.com/v1/payment_intents',
            token: ApiKeys.secretKey,
            contentType: 'application/x-www-form-urlencoded')
        .then((value) {});
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);

    return paymentIntentModel;
  }

  Future initPaymentSheet({
    required var paymentIntentClientSecret,
    // required InitiPaymentSheetInputModel
    //   initiPaymentSheetInputModel
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret:
            paymentIntentClientSecret, // initiPaymentSheetInputModel.clientSecret,
        // customerEphemeralKeySecret:
        //     initiPaymentSheetInputModel.ephemeralKeySecret,
        // customerId: initiPaymentSheetInputModel.customerId,
        merchantDisplayName: 'tharwat',
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }
}
