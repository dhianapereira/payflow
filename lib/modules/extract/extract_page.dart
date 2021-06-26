import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_widget.dart';

class ExtarctPage extends StatefulWidget {
  const ExtarctPage({Key? key}) : super(key: key);

  @override
  State<ExtarctPage> createState() => _ExtarctPageState();
}

class _ExtarctPageState extends State<ExtarctPage> {
  final _boletoListController = BoletoListController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildTitle(),
        buildLine(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: BoletoListWidget(
            boletoListController: _boletoListController,
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
            "Meus extratos",
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
