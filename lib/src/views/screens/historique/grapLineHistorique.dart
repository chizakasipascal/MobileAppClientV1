import 'package:flutter/material.dart';

class GrapLineHistorique extends StatelessWidget {
  final Widget widget;

  const GrapLineHistorique({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: 100,
      child: widget,
    );
  }
}
