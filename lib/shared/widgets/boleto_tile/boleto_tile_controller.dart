import 'dart:async';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BoletoTileController {
  Future<void> deleteBoleto({required String id}) async {
    final instace = await SharedPreferences.getInstance();
    final boletos = instace.getStringList('boletos') ?? <String>[];
    List<String> list = <String>[];

    for (var boleto in boletos) {
      if (BoletoModel.fromJson(boleto).id != id) {
        list.add(boleto);
      }
    }

    await instace.setStringList('boletos', <String>[]);

    await instace.setStringList('boletos', list);
  }

  Future<void> payBoleto({required String id}) async {
    final instace = await SharedPreferences.getInstance();
    final boletos = instace.getStringList('boletos') ?? <String>[];
    List<String> list = boletos;

    for (var boleto in list) {
      if (BoletoModel.fromJson(boleto).id == id) {
        BoletoModel.fromJson(boleto).setIsPaid(true);
      }
    }

    await instace.setStringList('boletos', <String>[]);

    await instace.setStringList('boletos', list);
  }
}
