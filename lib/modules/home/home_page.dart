import 'package:flutter/material.dart';
import 'package:payflow/modules/home/home_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/utils/app_navigator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController();

  List<Widget> pages = [
    Container(color: Colors.red),
    Container(color: Colors.yellow),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: pages[homeController.currentPage],
      bottomNavigationBar: buildBottomNavigatorBar(),
    );
  }

  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(152),
      child: Container(
        height: 152,
        color: AppColors.primary,
        child: Center(
          child: userInfo(),
        ),
      ),
    );
  }

  ListTile userInfo() {
    return ListTile(
      title: Text.rich(
        TextSpan(
          text: "Olá, ",
          style: AppTextStyles.titleRegular,
          children: [
            TextSpan(
              text: "Dhiana",
              style: AppTextStyles.titleBoldBackground,
            ),
          ],
        ),
      ),
      subtitle: Text(
        "Mantenha suas contas em dia",
        style: AppTextStyles.captionShape,
      ),
      trailing: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }

  SizedBox buildBottomNavigatorBar() {
    return SizedBox(
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              homeController.setPage(0);
              setState(() {});
            },
            icon: const Icon(
              Icons.home,
              color: AppColors.primary,
            ),
          ),
          buildAddBoxOutlinedButton(),
          IconButton(
            onPressed: () {
              homeController.setPage(2);
              setState(() {});
            },
            icon: const Icon(
              Icons.description_outlined,
              color: AppColors.body,
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector buildAddBoxOutlinedButton() {
    return GestureDetector(
      onTap: () => push(context, "/barcode_scanner"),
      child: Container(
        height: 56,
        width: 56,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(5),
        ),
        child: const Icon(
          Icons.add_box_outlined,
          color: AppColors.background,
        ),
      ),
    );
  }
}
