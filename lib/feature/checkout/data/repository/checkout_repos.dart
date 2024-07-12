import 'package:dartz/dartz.dart';
import 'package:payment_app/core/errors/failures.dart';
import 'package:payment_app/core/utils/strip_service.dart';
import 'package:payment_app/feature/checkout/data/models/payment_intent_input_model.dart';

abstract class CheckoutRepository {
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel});
}

class CheckoutRepositoryImpl extends CheckoutRepository {
  final StripService stripService = StripService();

  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripService.makeStripePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return right(null);
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
