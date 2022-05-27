// ignore: file_names
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mobileappclientv1/src/const/app_theme.dart';
import 'package:mobileappclientv1/src/const/assets.dart';
import 'package:mobileappclientv1/src/utils/utils.dart';
import 'package:mobileappclientv1/src/views/widgets/widgets.dart';

class DialogCall extends StatelessWidget {
  const DialogCall({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
          child: Container(
              decoration: BoxDecoration(
                color: kWhiteColor.withOpacity(0.7),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox(
                height: size.height / 2,
                width: size.width - 70,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 76,
                        width: 76,
                        decoration: const BoxDecoration(
                          color: kGreyColorOpacity,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: SizedBox(
                            height: 40.96,
                            width: 40.96,
                            child: Image.asset(Assets.micro),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Assistance",
                        textAlign: TextAlign.center,
                        style: themeData.textTheme.bodyText2,
                      ),
                      const SizedBox(height: 10),
                      LineWithCircleRoundConer(
                        isEmptyOne: true,
                        size: size / 2,
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        " +243 000 000 000",
                        textAlign: TextAlign.center,
                        style: themeData.textTheme.bodyText2,
                      ),
                      const SizedBox(height: 10),
                      LineWithCircleRoundConer(
                        isEmptyOne: true,
                        size: size / 2,
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CallButtomMenu(
                            description: "pause",
                            widget: Image.asset(Assets.pause),
                          ),
                          CallButtomMenu(
                            description: "mute",
                            isPressed: true,
                            widget: Image.asset(Assets.mute),
                          ),
                          CallButtomMenu(
                            description: "forward",
                            widget: Image.asset(Assets.forward),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CallButtomMenu(
                            description: "ajouter",
                            widget: Image.asset(Assets.ajouter),
                            desactivate: true,
                          ),
                          CallButtomMenu(
                            description: "racrocher",
                            isPressed: true,
                            widget: Image.asset(Assets.racroche),
                            color: Colors.transparent,
                          ),
                          CallButtomMenu(
                            description: "video",
                            widget: Image.asset(Assets.video),
                            desactivate: true,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}

class CallButtomMenu extends StatelessWidget {
  const CallButtomMenu({
    Key? key,
    required this.description,
    required this.widget,
    this.isPressed = false,
    this.desactivate = false,
    this.color = kGreyColor,
  }) : super(key: key);
  final String description;
  final Widget widget;
  final bool? isPressed, desactivate;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 42,
          width: 42,
          decoration: BoxDecoration(
            color: desactivate == true ? Colors.transparent : kWhiteColor,
            shape: BoxShape.circle,
          ),
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(
                desactivate == true ? kGreyColorOpacity : color,
                BlendMode.srcATop),
            child: Padding(
              padding: EdgeInsets.all(color != kGreyColor ? 0.0 : 10.0),
              child: widget,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          description,
          style: themeData.textTheme.bodyText2!.copyWith(
              color: desactivate == true ? kGreyColorOpacity : kGreyColor),
        )
      ],
    );
  }
}
