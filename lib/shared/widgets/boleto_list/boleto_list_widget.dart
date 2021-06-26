import 'package:flutter/material.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:payflow/shared/widgets/boleto_tile/boleto_tile_widget.dart';
import 'package:payflow/shared/widgets/error_message/error_message_widget.dart';

class BoletoListWidget extends StatefulWidget {
  final BoletoListController boletoListController;
  final String errorMessage;

  const BoletoListWidget({
    Key? key,
    required this.boletoListController,
    required this.errorMessage,
  }) : super(key: key);

  @override
  _BoletoListWidgetState createState() => _BoletoListWidgetState();
}

class _BoletoListWidgetState extends State<BoletoListWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<BoletoModel>>(
      valueListenable: widget.boletoListController.boletosNotifier,
      builder: (_, boletos, __) {
        return Visibility(
          visible: widget.boletoListController.boletos.isEmpty,
          child: Column(
            children: widget.boletoListController.boletos
                .map((boleto) => BoletoTileWidget(boletoModel: boleto))
                .toList(),
          ),
          replacement: ErrorMessageWidget(
            text: widget.errorMessage,
            icon: Icons.cancel,
          ),
        );
      },
    );
  }
}
