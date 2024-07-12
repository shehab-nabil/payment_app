import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_app/core/utils/api_keys.dart';
import 'package:payment_app/core/utils/api_service.dart';
import 'package:payment_app/feature/checkout/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:payment_app/feature/checkout/data/models/init_payment_sheet_input_modle.dart';
import 'package:payment_app/feature/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_app/feature/checkout/data/models/payment_intent_model/payment_intent_model.dart';

class StripService {
  final ApiService apiService = ApiService();
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
      body: paymentIntentInputModel.toJson(),
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretKey,
      contentType: Headers
          .formUrlEncodedContentType, //'application/x-www-form-urlencoded',
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);

    return paymentIntentModel;
  }

  Future initPaymentSheet(
      {required InitPaymentSheetInputModel initPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
        // paymentIntentClientSecret, //
        customerEphemeralKeySecret:
            initPaymentSheetInputModel.ephemeralKeySecret,
        customerId: initPaymentSheetInputModel.customerId,
        merchantDisplayName: 'test',
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makeStripePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntent = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKeyModel = await createEphemeralKey(
      customerId: paymentIntentInputModel.customerId,
    );
    var initPaymentSheetInputModel = InitPaymentSheetInputModel(
      clientSecret: paymentIntent.clientSecret!,
      ephemeralKeySecret: ephemeralKeyModel.secret!,
      customerId: paymentIntentInputModel.customerId,
    );
    await initPaymentSheet(
        initPaymentSheetInputModel: initPaymentSheetInputModel);
    await displayPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    var response = await apiService.post(
        body: {'customer': customerId},
        contentType: Headers.formUrlEncodedContentType,
        url: 'https://api.stripe.com/v1/ephemeral_keys',
        token: ApiKeys.secretKey,
        headers: {
          'Authorization': "Bearer ${ApiKeys.secretKey}",
          'Stripe-Version': '2024-06-20',
        });

    var ephermeralKey = EphemeralKeyModel.fromJson(response.data);

    return ephermeralKey;
  }
}
