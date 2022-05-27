import 'package:flutter/material.dart';

class GrapCircleHistorique extends StatelessWidget {
  final Widget widget;

  const GrapCircleHistorique({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: widget,
    );
  }
}
