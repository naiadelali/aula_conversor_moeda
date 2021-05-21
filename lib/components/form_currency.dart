import 'package:flutter/material.dart';

import 'default_input.dart';

class FormCurrency extends StatelessWidget {
  final TextEditingController realTextEditingController;
  final TextEditingController dolarTextEditingController;
  final TextEditingController euroTextEditingController;
  final Function(String) realChanges;
  final Function(String) dolarChanges;
  final Function(String) euroChanges;

  const FormCurrency(
      {Key? key,
      required this.realTextEditingController,
      required this.dolarTextEditingController,
      required this.euroTextEditingController,
      required this.realChanges,
      required this.dolarChanges,
      required this.euroChanges})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              controller: realTextEditingController,
              onChange: realChanges,
            ),
            DefaultInput(
              prefixText: 'US\$ ',
              labelText: 'Dólares',
              controller: dolarTextEditingController,
              onChange: dolarChanges,
            ),
            DefaultInput(
              labelText: 'Euros',
              prefixText: '€ ',
              controller: euroTextEditingController,
              onChange: euroChanges,
            )
          ],
        ),
      ),
    );
  }
}
