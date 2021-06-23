import 'package:flutter/material.dart';

push(BuildContext context, String routeName, {bool replace = false}) {
  if (replace) {
    Navigator.of(context).popUntil((route) => route.isFirst);

    Navigator.pushReplacementNamed(context, routeName);
  } else {
    Navigator.pushNamed(context, routeName);
  }
}

popAndPush(BuildContext context, String routeName) {
  Navigator.popUntil(context, (route) => route.isFirst);

  Navigator.pushNamed(context, routeName);
}

popUntil(BuildContext context) {
  Navigator.popUntil(context, (route) => route.isFirst);
}
