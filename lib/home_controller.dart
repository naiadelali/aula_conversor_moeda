import 'models/currency_model.dart';
import 'repositories/currency_repository.dart';

class HomeController {
  final _repository = CurrencyRepository();

  Future<CurrencyModel> getCurrencyRealToEuroAndDolar() async {
    return _repository.get();
  }
}
