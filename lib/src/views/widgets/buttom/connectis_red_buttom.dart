import 'package:flutter/material.dart';
import 'package:mobileappclientv1/src/const/app_theme.dart';
import 'package:mobileappclientv1/src/utils/colors.dart';

class ConnectisRedButtom extends StatelessWidget {
  final String descriprion;
  final ButtonStyle? style;
  final Color colortextStyle;
  final VoidCallback onPressed;
  const ConnectisRedButtom({
    Key? key,
    this.descriprion = "descriprion",
    this.style,
    required this.onPressed,
    this.colortextStyle = kWhiteColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110.11,
      height: 25.81,
      child: ElevatedButton(
        style: style,
        onPressed: onPressed,
        child: Text(
          descriprion,
          style: themeData.textTheme.bodyText2!
              .copyWith(color: colortextStyle, fontSize: 12),
        ),
      ),
    );
  }
}
