import 'dart:convert';

class CurrencyModel {
  double dolar;
  double euro;
  CurrencyModel(
    this.dolar,
    this.euro,
  );

  Map<String, dynamic> toMap() {
    return {
      'dolar': dolar,
      'euro': euro,
    };
  }

  factory CurrencyModel.fromMap(Map<String, dynamic> map) {
    return CurrencyModel(
      map['dolar'],
      map['euro'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrencyModel.fromJson(String source) => CurrencyModel.fromMap(json.decode(source));
}
