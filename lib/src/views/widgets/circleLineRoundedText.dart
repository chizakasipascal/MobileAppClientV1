import 'package:flutter/material.dart';
import 'package:mobileappclientv1/src/utils/utils.dart';

class CircleLineRoundedText extends StatelessWidget {
  final bool isEmpty;
  final Color color;
  const CircleLineRoundedText({
    Key? key,
    required this.isEmpty,
    this.color = kGreyColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isEmpty ? 4 : 7,
      width: isEmpty ? 4 : 7,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
    );
  }
}
