import 'package:flutter/material.dart';
import 'package:payflow/modules/menu/menu_controller.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  late MenuController menu;

  @override
  void initState() {
    super.initState();
    menu = MenuController(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return menu.loadMenu;
  }
}
