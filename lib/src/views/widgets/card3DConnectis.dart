import 'package:flutter/material.dart';
import 'package:mobileappclientv1/src/const/assets.dart';

class Card3DConnectis extends StatelessWidget {
  const Card3DConnectis({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //color: Colors.deepOrange,
      height: size.height / 5,
      width: size.width,
      child: Image.asset(
        Assets.logo,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
