import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class ErrorMessageWidget extends StatelessWidget {
  final String text;
  final IconData icon;

  const ErrorMessageWidget({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: AppColors.heading,
            size: 26,
          ),
          const SizedBox(height: 4),
          Text(
            text,
            style: AppTextStyles.buttonGray,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
