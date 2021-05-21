import 'package:aula_conversor_moeda/home_controller.dart';
import 'package:flutter/material.dart';

import 'components/form_currency.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController();

  @override
  void initState() {
    super.initState();
    _controller.getCurrencyRealToEuroAndDolar().then((value) {
      setState(() {
        _controller.currency = value;
      });
    }).catchError((error, stackTrace) {
      print('Error: $error');
    });
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
      body: (_controller.currency != null)
          ? FormCurrency(
              dolarChanges: _controller.dolarChanges,
              dolarTextEditingController: _controller.dolarTextEditingController,
              euroChanges: _controller.euroChanges,
              euroTextEditingController: _controller.euroTextEditingController,
              realChanges: _controller.realChanges,
              realTextEditingController: _controller.realTextEditingController,
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
