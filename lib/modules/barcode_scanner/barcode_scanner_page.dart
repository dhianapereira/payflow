import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/bottom_sheet/bottom_sheet_widget.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({Key? key}) : super(key: key);

  @override
  _BarcodeScannerPageState createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  @override
  Widget build(BuildContext context) {
    return BottomSheetWidget(
      title: "Não foi possível identificar um código de barras.",
      subtitle: "Tente escanear novamente ou digite o código do seu boleto.",
      primaryLabel: "Escanear novamente",
      primaryOnPressed: () {},
      secondaryLabel: "Digitar código",
      secondaryOnPressed: () {},
    );
    return SafeArea(
      child: RotatedBox(
        quarterTurns: 1,
        child: Scaffold(
          appBar: buildAppBar(),
          body: buildBody(),
          bottomNavigationBar: SetLabelButtons(
            primaryLabel: "Inserir código do boleto",
            primaryOnPressed: () {},
            secondaryLabel: "Adicionar da galeria",
            secondaryOnPressed: () {},
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      title: Text(
        "Escaneie o código de barras do boleto",
        style: AppTextStyles.buttonBackground,
      ),
      leading: const BackButton(color: AppColors.background),
    );
  }

  Column buildBody() {
    return Column(
      children: [
        Expanded(
          child: Container(color: Colors.black),
        ),
        Expanded(
          flex: 2,
          child: Container(color: Colors.transparent),
        ),
        Expanded(
          child: Container(color: Colors.black),
        )
      ],
    );
  }
}
