import 'package:aula_conversor_moeda/components/default_input.dart';
import 'package:aula_conversor_moeda/repositories/currency_repository.dart';
import 'package:flutter/material.dart';

import 'models/currency_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _realTextEditingController = TextEditingController();
  final _dolarTextEditingController = TextEditingController();
  final _euroTextEditingController = TextEditingController();
  final _repository = CurrencyRepository();

  late CurrencyModel _currency;

  @override
  void initState() {
    super.initState();
    _currency = CurrencyModel(0.0, 0.0);
  }

  void realChanges(String text) {
    double real = double.parse(text);
    _dolarTextEditingController.text =
        (real / _currency.dolar).toStringAsFixed(2);
    _euroTextEditingController.text =
        (real / _currency.euro).toStringAsFixed(2);
  }

  void dolarChanges(String text) {
    double dolar = double.parse(text);
    _realTextEditingController.text =
        (dolar * _currency.dolar).toStringAsFixed(2);
    _euroTextEditingController.text =
        (dolar * _currency.dolar / _currency.euro).toStringAsFixed(2);
  }

  void euroChanges(String text) {
    double euro = double.parse(text);
    _realTextEditingController.text =
        (euro * _currency.euro).toStringAsFixed(2);
    _dolarTextEditingController.text =
        (euro * _currency.euro / _currency.dolar).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Image.asset('assets/images/logo_home.png'),
            ),
            Text(
              'Conversor de moedas',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      body: _buildBody(context),
    );
  }

  FutureBuilder<CurrencyModel> _buildBody(BuildContext context) {
    return FutureBuilder<CurrencyModel>(
      future: _repository.get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // final CurrencyModel posts = snapshot;
          return Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Icon(
                      Icons.attach_money,
                      color: Theme.of(context).primaryColor,
                      size: 180,
                    ),
                  ),
                  DefaultInput(
                    labelText: 'Reais',
                    prefixText: 'R\$ ',
                    controller: _realTextEditingController,
                    onChange: realChanges,
                  ),
                  DefaultInput(
                    labelText: 'Dólares',
                    prefixText: 'US\$ ',
                    controller: _dolarTextEditingController,
                    onChange: dolarChanges,
                  ),
                  DefaultInput(
                    labelText: 'Euros',
                    prefixText: '€ ',
                    controller: _euroTextEditingController,
                    onChange: dolarChanges,
                  )
                ],
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
