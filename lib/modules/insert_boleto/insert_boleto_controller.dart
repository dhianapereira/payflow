import 'package:flutter/material.dart';

class InsertBoletoController {
  final formKey = GlobalKey<FormState>();

  String? validateName(String? value) {
    return value?.isEmpty ?? true ? "O nome não pode ser vazio" : null;
  }

  String? validateDueDate(String? value) {
    return value?.isEmpty ?? true
        ? "A data de vencimento não pode ser vazio"
        : null;
  }

  String? validateValue(double value) {
    return value == 0 ? "Insira um valor maior que R\$ 0,00" : null;
  }

  String? validateCode(String? value) {
    return value?.isEmpty ?? true
        ? "O código do boleto não pode ser vazio"
        : null;
  }

  void onChange({
    String? name,
    String? dueDate,
    double? value,
    String? barcode,
  }) {}

  void registerBoleto() {
    final form = formKey.currentState;

    if (form!.validate()) {}
  }
}
