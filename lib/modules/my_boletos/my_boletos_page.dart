import 'package:flutter/material.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/boleto_info/boleto_info_widget.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_widget.dart';

class MyBoletosPage extends StatefulWidget {
  const MyBoletosPage({Key? key}) : super(key: key);

  @override
  State<MyBoletosPage> createState() => _MyBoletosPageState();
}

class _MyBoletosPageState extends State<MyBoletosPage> {
  final _boletoListController = BoletoListController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          buildBoletoInfoWidget(),
          buildTitle(),
          buildLine(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: BoletoListWidget(
              boletoListController: _boletoListController,
            ),
          ),
        ],
      ),
    );
  }

  Stack buildBoletoInfoWidget() {
    return Stack(
      children: [
        Container(
          color: AppColors.primary,
          height: 40,
          width: double.maxFinite,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ValueListenableBuilder<List<BoletoModel>>(
            valueListenable: _boletoListController.boletosNotifier,
            builder: (_, boletos, __) {
              return BoletoInfoWidget(size: boletos.length);
            },
          ),
        ),
      ],
    );
  }

  Padding buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
      child: Row(
        children: [
          Text(
            "Meus boletos",
            style: AppTextStyles.titleBoldHeading,
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
