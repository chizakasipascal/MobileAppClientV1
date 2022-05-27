import 'package:flutter/material.dart';
import 'package:mobileappclientv1/src/const/app_theme.dart';
import 'package:mobileappclientv1/src/utils/utils.dart';
import 'package:mobileappclientv1/src/views/widgets/lineWithCircleRoundConer.dart';

class PostionnedWidgetColumnCenter extends StatelessWidget {
  const PostionnedWidgetColumnCenter({
    Key? key,
    required this.appname,
    required this.size,
    required this.widget,
    required this.labelname,
    required this.headLabel,
    required this.subLabel,
  }) : super(key: key);

  final String appname;
  final Size size;
  final bool widget;
  final String labelname;
  final String headLabel;
  final String subLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          appname,
          style: themeData.textTheme.bodyText2!.copyWith(
            fontWeight: FontWeight.bold,
            color: kGreyColor,
          ),
        ),
        const SizedBox(height: 5),
        LineWithCircleRoundConer(
          isEmptyOne: true,
          size: size * .5,
          color: kGreyColor,
          mainAxisAlignment: MainAxisAlignment.start,
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 100,
          width: 100,
          child: CircleAvatar(
            backgroundColor: kWhiteColor,
            child: SizedBox(
              height: 90,
              width: 90,
              child: CircleAvatar(
                backgroundColor: kGreyColor,
                child: widget
                    ? const Icon(
                        Icons.person_pin,
                        color: kWhiteColor,
                        size: 70,
                      )
                    : Text(
                        labelname.substring(0, 1).toUpperCase(),
                        style: themeData.textTheme.bodyLarge!.copyWith(
                          color: kWhiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                        ),
                      ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text.rich(
          TextSpan(
            style:
                themeData.textTheme.headlineLarge!.copyWith(color: kGreyColor),
            children: [
              TextSpan(
                text: headLabel,
              ),
              TextSpan(
                text: labelname.substring(0, 1).toUpperCase() +
                    labelname.substring(1).toLowerCase() +
                    ',',
                style: themeData.textTheme.bodyText2!
                    .copyWith(fontWeight: FontWeight.bold, color: kGreyColor),
              ),
              TextSpan(
                text: subLabel + '\n',
              ),
              TextSpan(
                text: appname.substring(0, 1).toUpperCase() +
                    appname.substring(1).toLowerCase(),
                style: themeData.textTheme.bodyText2!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: kGreyColor,
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        LineWithCircleRoundConer(
          isEmptyOne: true,
          size: size * .8,
          mainAxisAlignment: MainAxisAlignment.start,
        ),
      ],
    );
  }
}
