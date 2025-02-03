import 'package:flutter/material.dart';

class Custominput extends StatelessWidget {
  final TextEditingController? contrll;
  final String name;
  final IconData icons;
  final String? Function(String?)? validate;

  const Custominput(
      {super.key,
      required this.contrll,
      required this.name,
      required this.icons,
      this.validate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TextFormField(
      controller: contrll,
      decoration: InputDecoration(
          border: const UnderlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(45))),
          labelText: name,
          prefixIcon: Icon(
            icons,
            size: 20,
          )),
      validator: validate,
    ));
  }
}
