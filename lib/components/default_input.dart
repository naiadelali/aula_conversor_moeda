import 'package:flutter/material.dart';

class DefaultInput extends StatelessWidget {
  final String labelText;
  final String prefixText;
  final TextEditingController controller;
  final Function(String) onChange;
  const DefaultInput({
    Key? key,
    required this.labelText,
    required this.prefixText,
    required this.controller,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextField(
        controller: controller,
        onChanged: onChange,
        style: TextStyle(
          color: Theme.of(context).accentColor,
          fontSize: 14.0,
        ),
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          labelText: labelText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).accentColor,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 1.5,
            ),
          ),
          labelStyle: TextStyle(
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.bold),
          prefixText: prefixText,
          prefixStyle: TextStyle(color: Theme.of(context).accentColor),
        ),
        keyboardType: TextInputType.numberWithOptions(decimal: true),
      ),
    );
  }
}
