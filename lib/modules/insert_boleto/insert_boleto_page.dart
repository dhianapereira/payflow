import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/input_text/input_text_widget.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons.dart';

class InsertBoletoPage extends StatelessWidget {
  const InsertBoletoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: const BackButton(color: AppColors.input),
      ),
      body: buildBody(),
      bottomNavigationBar: SetLabelButtons(
        primaryLabel: "Cancelar",
        primaryOnPressed: () {},
        secondaryLabel: "Cadastrar",
        secondaryOnPressed: () {},
        enableSecondaryColor: true,
      ),
    );
  }

  Padding buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              "Preencha os dados do boleto",
              style: AppTextStyles.titleBoldHeading,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 24),
          InputTextWidget(
            icon: Icons.description_outlined,
            label: "Nome do boleto",
            onChanged: (value) {},
          ),
          InputTextWidget(
            icon: FontAwesomeIcons.timesCircle,
            label: "Vencimento",
            onChanged: (value) {},
          ),
          InputTextWidget(
            icon: FontAwesomeIcons.moneyBillAlt,
            label: "Valor",
            onChanged: (value) {},
          ),
          InputTextWidget(
            icon: FontAwesomeIcons.barcode,
            label: "Código",
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
