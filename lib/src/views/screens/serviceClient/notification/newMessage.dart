import 'package:flutter/material.dart';
import 'package:mobileappclientv1/src/const/app_theme.dart';
import 'package:mobileappclientv1/src/const/assets.dart';

class NewMessage extends StatelessWidget {
  const NewMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          "Vous n’avez  pas de notification",
          style: themeData.textTheme.bodyText2,
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 95,
          width: 95,
          child: Image.asset(Assets.notificationEmpty),
        )
      ],
    );
  }
}
