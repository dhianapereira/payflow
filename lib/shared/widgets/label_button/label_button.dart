import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class LabelButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final TextStyle? style;
  final bool showProgress;

  const LabelButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.showProgress = false,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextButton(
        onPressed: onPressed,
        child: showProgress
            ? const Center(child: CircularProgressIndicator())
            : Text(
                label,
                style: style ?? AppTextStyles.buttonHeading,
              ),
      ),
    );
  }
}
