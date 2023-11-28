import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class PaymentService {
  final Stripe _stripe = Stripe.instance;

  Future<PaymentSheetPaymentOption> initPayment(
      String? paymentIntentClientSecret) async {
    PaymentSheetPaymentOption? paymentResult = await _stripe.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            merchantDisplayName: "Pxl Me",
            setupIntentClientSecret: paymentIntentClientSecret!,
            style: ThemeMode.system));
    return paymentResult!;
  }

  Future<void> displayPaymentSheet() async {
    try {
      await Stripe.instance
          .presentPaymentSheet()
          .then((value) {})
          .onError((error, stackTrace) {
        throw Exception(error);
      });
    } on StripeException catch (e) {
      log('Error is:---> $e');
    } catch (e) {
      log('$e');
    }
  }
}
