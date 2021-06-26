import 'package:flutter/material.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_widget.dart';

class ExtractPage extends StatefulWidget {
  const ExtractPage({Key? key}) : super(key: key);

  @override
  State<ExtractPage> createState() => _ExtractPageState();
}

class _ExtractPageState extends State<ExtractPage> {
  final _boletoListController = BoletoListController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          buildTitle(),
          buildLine(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: BoletoListWidget(
              errorMessage: "Nenhum boleto foi pago",
              boletoListController: _boletoListController,
            ),
          ),
        ],
      ),
    );
  }

  Padding buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Meus extratos",
            style: AppTextStyles.titleBoldHeading,
          ),
          ValueListenableBuilder<List<BoletoModel>>(
            valueListenable: _boletoListController.boletosNotifier,
            builder: (_, boletos, __) {
              int counter = 0;

              boletos.map((boleto) {
                if (boleto.isPaid) {
                  counter++;
                }
              });

              return Text(
                "$counter pago(s)",
                style: AppTextStyles.buttonGray,
              );
            },
          ),
        ],
      ),
    );
  }

  Padding buildLine() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
      child: Divider(
        thickness: 1,
        height: 1,
        color: AppColors.stroke,
      ),
    );
  }
}
