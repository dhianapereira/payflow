import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/boleto_tile/boleto_tile_controller.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons.dart';

class BoletoTileWidget extends StatefulWidget {
  final BoletoModel boletoModel;

  const BoletoTileWidget({
    Key? key,
    required this.boletoModel,
  }) : super(key: key);

  @override
  State<BoletoTileWidget> createState() => _BoletoTileWidgetState();
}

class _BoletoTileWidgetState extends State<BoletoTileWidget> {
  final _boletoTileController = BoletoTileController();

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.right,
      child: ListTile(
        onTap:
            widget.boletoModel.isPaid ? null : () => _modalBottomSheet(context),
        contentPadding: EdgeInsets.zero,
        title: Text(
          widget.boletoModel.name!,
          style: AppTextStyles.titleListTile,
        ),
        subtitle: Text(
          "Vence em ${widget.boletoModel.dueDate}",
          style: AppTextStyles.captionBody,
        ),
        trailing: Text.rich(
          TextSpan(
            text: "R\$ ",
            style: AppTextStyles.trailingRegular,
            children: [
              TextSpan(
                text: widget.boletoModel.value!.toStringAsFixed(2),
                style: AppTextStyles.trailingBold,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _modalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Text.rich(
                TextSpan(
                  text: "O boleto, ",
                  style: AppTextStyles.titleModal,
                  children: [
                    TextSpan(
                      text: widget.boletoModel.name,
                      style: AppTextStyles.titleBoldHeading,
                    ),
                    TextSpan(
                      text: "\nno valor de R\$ ",
                      style: AppTextStyles.titleModal,
                    ),
                    TextSpan(
                      text: widget.boletoModel.value.toString(),
                      style: AppTextStyles.titleBoldHeading,
                    ),
                    TextSpan(
                        text: "\nfoi pago?", style: AppTextStyles.titleModal),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SetLabelButtons(
                primaryLabel: "Ainda n??o",
                primaryOnPressed: () => Navigator.pop(context),
                secondaryLabel: "Sim",
                secondaryOnPressed: () async {
                  await _boletoTileController.payBoleto(
                    id: widget.boletoModel.id,
                  );
                  setState(() {});
                  Navigator.pop(context);
                },
                enableSecondaryColor: true,
              ),
            ),
            const Divider(
              thickness: 1,
              height: 1,
              endIndent: 24,
              indent: 24,
              color: AppColors.stroke,
            ),
            const SizedBox(height: 24),
            const Divider(
              thickness: 1,
              height: 1,
              color: AppColors.stroke,
            ),
            buildDeleteButton(context),
          ],
        );
      },
    );
  }

  InkWell buildDeleteButton(BuildContext context) {
    return InkWell(
      onTap: () async {
        await _boletoTileController.deleteBoleto(id: widget.boletoModel.id);
        setState(() {});
        Navigator.pop(context);
      },
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(FontAwesomeIcons.trash, color: AppColors.delete),
                const SizedBox(width: 16),
                Container(
                  height: 56,
                  width: 1,
                  color: AppColors.stroke,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Deletar boleto",
                  style: AppTextStyles.buttonLogout,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
