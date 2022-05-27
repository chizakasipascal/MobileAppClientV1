import 'package:flutter/material.dart';

class MostByCard extends StatelessWidget {
  final Widget widget;

  const MostByCard({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: widget,
    );
  }
}
