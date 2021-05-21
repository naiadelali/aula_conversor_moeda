import 'package:aula_conversor_moeda/models/currency_model.dart';
import 'package:dio/dio.dart';

class CurrencyRepository {
  @override
  Future<CurrencyModel> get() async {
    final Dio dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    const request = "https://api.hgbrasil.com/finance?format=json&key=60df7607";
    final response = await dio.get(request,
        options: new Options(contentType: 'application/json'));

    if (response.statusCode == 200) {
      final result = CurrencyModel.fromMap(response.data);
      return result;
    } else {
      throw Exception("Erro ao acessar a api");
    }
  }
}
