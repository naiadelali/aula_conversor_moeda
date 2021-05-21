import 'package:flutter/material.dart';

import 'models/currency_model.dart';
import 'repositories/currency_repository.dart';

class HomeController {
  final _repository = CurrencyRepository();
  final realTextEditingController = TextEditingController();
  final dolarTextEditingController = TextEditingController();
  final euroTextEditingController = TextEditingController();
  CurrencyModel? currency;



  Future<CurrencyModel> getCurrencyRealToEuroAndDolar() async {
    return _repository.get();
  }

  void realChanges(String text) {
    double real = double.tryParse(text) ?? 0;
    if (currency != null) {
      dolarTextEditingController.text =
          (real / currency!.dolar).toStringAsFixed(2);
      euroTextEditingController.text =
          (real / currency!.euro).toStringAsFixed(2);
    }
  }

  void dolarChanges(String text) {
    double dolar = double.tryParse(text) ?? 0;
    if (currency != null) {
      realTextEditingController.text =
          (dolar * currency!.dolar).toStringAsFixed(2);
      euroTextEditingController.text =
          (dolar * currency!.dolar / currency!.euro).toStringAsFixed(2);
    }
  }

  void euroChanges(String text) {
    double euro = double.tryParse(text) ?? 0;
    if (currency != null) {
      realTextEditingController.text =
          (euro * currency!.euro).toStringAsFixed(2);
      dolarTextEditingController.text =
          (euro * currency!.euro / currency!.dolar).toStringAsFixed(2);
    }
  }
}
