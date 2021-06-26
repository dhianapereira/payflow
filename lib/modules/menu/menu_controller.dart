import 'package:flutter/material.dart';
import 'package:payflow/modules/menu/items_page.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/utils/app_navigator.dart';
import 'package:payflow/shared/widgets/alert/app_alert.dart';
import 'package:payflow/shared/widgets/menu/menu.dart';
import 'package:payflow/shared/widgets/menu/menu_item.dart';
import 'package:payflow/shared/widgets/menu/title_and_backbutton.dart';

class MenuController {
  BuildContext context;

  MenuController({required this.context});

  Menu get loadMenu => _mainMenu;

  Menu get _mainMenu {
    List<Widget> itens = [
      MenuItem(
        icon: Icons.person_outline,
        title: "Perfil",
        nextPageFunction: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return ItemsPage(body: _profileMenu);
          }));
        },
      ),
      MenuItem(
        icon: Icons.logout,
        title: "Sair",
        nextPageFunction: () {
          AppAlert.dialog(
            context: context,
            title: "Sair do PayFlow?",
            message: "Deseja mesmo sair do aplicativo?",
            firstButtonTitle: "Não",
            secondButtonTitle: "Sim",
            function: () {
              push(context, "/login", replace: true);
            },
          );
        },
      ),
    ];

    return Menu(menuItems: itens);
  }

  Menu get _profileMenu {
    List<Widget> itens = [
      TitleAndBackButton(
        child: Text("Perfil", style: AppTextStyles.titleMenu),
      ),
      MenuItem(
        title: "Visualizar Perfil",
        nextPageFunction: () => push(context, "/profile"),
      ),
    ];

    return Menu(menuItems: itens);
  }
}
