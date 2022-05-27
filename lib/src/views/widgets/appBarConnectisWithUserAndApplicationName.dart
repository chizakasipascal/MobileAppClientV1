import 'package:flutter/material.dart';
import 'package:mobileappclientv1/src/views/widgets/widgets.dart';

class AppBarConnectisWithUserAndApplicationName extends StatelessWidget {
  final Size size;
  final String appname;
  final String headLabel;
  final String labelname;
  final String subLabel;
  final bool avatarProfil, postionnedModify;
  const AppBarConnectisWithUserAndApplicationName({
    Key? key,
    required this.size,
    this.appname = "ESPACE REVENDEUR",
    this.headLabel = "Bonjour ",
    this.labelname = "Uttilisateur ",
    this.subLabel = "Bienvenu dans votre \n",
    this.avatarProfil = false,
    this.postionnedModify = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return postionnedModify
        ? PostionnedWidgetColumnLeft(
            appname: appname,
            size: size,
            widget: avatarProfil,
            labelname: labelname,
            headLabel: headLabel,
            subLabel: "Vous êtes sur le point de transférer des\n",
          )
        : PostionnedWidgetColumnCenter(
            appname: appname,
            size: size,
            widget: avatarProfil,
            labelname: labelname,
            headLabel: headLabel,
            subLabel: subLabel,
          );
  }
}
