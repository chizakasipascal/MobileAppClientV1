import 'package:flutter/material.dart';
import 'package:mobileappclientv1/src/const/app_theme.dart';
import 'package:mobileappclientv1/src/const/assets.dart';
import 'package:mobileappclientv1/src/utils/colors.dart';

class CallCenter extends StatelessWidget {
  const CallCenter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 27.13,
            width: 47.03,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(Assets.wifi),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 130,
            width: 130,
            decoration: const BoxDecoration(
              color: kGreyColorOpacity,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SizedBox(
                height: 68.85,
                width: 68.85,
                child: Image.asset(Assets.micro),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 183,
            child: Text(
              "Votre centre de service client dédié n’est plus qu’à un simple appel de près.",
              textAlign: TextAlign.center,
              style: themeData.textTheme.bodyText2,
            ),
          ),
        ],
      ),
    );
  }
}
