import 'package:flutter/material.dart';
import 'package:payflow/modules/login/login_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/social_login/social_login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginController = LoginController();

  @override
  void dispose() {
    _loginController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(0),
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            buildHeader(width: size.width, height: size.height * .4),
            buildPersonImage(height: size.height * .06),
            buildBody(height: size.height * .05),
          ],
        ),
      ),
    );
  }

  Container buildHeader({required double height, required double width}) {
    return Container(
      height: height,
      width: width,
      color: AppColors.primary,
    );
  }

  Positioned buildPersonImage({required double height}) {
    return Positioned(
      top: height,
      left: 0,
      right: 0,
      child: Image.asset(AppImages.person, width: 208, height: 290),
    );
  }

  Positioned buildBody({required double height}) {
    return Positioned(
      bottom: height,
      left: 0,
      right: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AppImages.logomini),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70),
            child: Text(
              "Organize seus boletos em um só lugar",
              textAlign: TextAlign.center,
              style: AppTextStyles.titleHome,
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: StreamBuilder<bool>(
              stream: _loginController.output,
              builder: (context, snapshot) {
                return SocialLoginButton(
                  onTap: () => _loginController.googleSignIn(context),
                  showProgress: _loginController.isProcessing,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
