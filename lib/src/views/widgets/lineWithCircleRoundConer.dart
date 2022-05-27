import 'package:flutter/material.dart';
import 'package:mobileappclientv1/src/utils/utils.dart';
import 'package:mobileappclientv1/src/views/widgets/circleLineRoundedText.dart';

class LineWithCircleRoundConer extends StatelessWidget {
  const LineWithCircleRoundConer({
    Key? key,
    required this.isEmptyOne,
    required this.size,
    this.color = kGreyColor,
    this.mainAxisAlignment = MainAxisAlignment.center,
  }) : super(key: key);

  final bool isEmptyOne;
  final Size size;
  final Color color;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        CircleLineRoundedText(
          isEmpty: isEmptyOne,
          color: color,
        ),
        Container(
          height: 0.3,
          width: size.width * .80,
          //padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          decoration: BoxDecoration(
            color: color.withOpacity(.5),
            borderRadius: const BorderRadius.all(
              Radius.circular(2),
            ),
          ),
        ),
        CircleLineRoundedText(
          isEmpty: isEmptyOne,
          color: color,
        ),
      ],
    );
  }
}
