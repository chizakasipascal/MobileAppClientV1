import 'package:flutter/material.dart';
import 'package:mobileappclientv1/src/const/app_theme.dart';
import 'package:mobileappclientv1/src/utils/utils.dart';
import 'package:mobileappclientv1/src/views/widgets/widgets.dart';

class PostionnedWidgetColumnLeft extends StatelessWidget {
  const PostionnedWidgetColumnLeft({
    Key? key,
    required this.appname,
    required this.size,
    required this.widget,
    required this.nameUser,
    required this.greetinglabel,
    required this.message,
  }) : super(key: key);

  final String appname;
  final Size size;
  final bool widget;
  final String nameUser;
  final String greetinglabel;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          appname,
          style: themeData.textTheme.bodyText2!
              .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        const SizedBox(height: 5),
        LineWithCircleRoundConer(
          isEmptyOne: true,
          size: size * .5,
          mainAxisAlignment: MainAxisAlignment.start,
        ),
        const SizedBox(height: 5),
        Row(
          children: [
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
                            size: 80,
                          )
                        : Text(
                            nameUser.substring(0, 1).toUpperCase(),
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
            const SizedBox(
              height: 10,
              width: 10,
            ),
            Expanded(
              child: Text.rich(
                TextSpan(
                  style: themeData.textTheme.bodyText2!.copyWith(
                    color: kGreyColor,
                  ),
                  children: [
                    TextSpan(
                      text: greetinglabel,
                    ),
                    TextSpan(
                      text: nameUser.substring(0, 1).toUpperCase() +
                          nameUser.substring(1).toLowerCase() +
                          '.',
                      style: themeData.textTheme.bodyText2!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: "\n$message",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        LineWithCircleRoundConer(
          isEmptyOne: true,
          size: size,
          color: kBlackColor,
          mainAxisAlignment: MainAxisAlignment.start,
        ),
      ],
    );
  }
}
