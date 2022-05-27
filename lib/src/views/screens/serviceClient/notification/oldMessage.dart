import 'package:flutter/material.dart';
import 'package:mobileappclientv1/src/const/app_theme.dart';
import 'package:mobileappclientv1/src/const/assets.dart';
import 'package:mobileappclientv1/src/views/widgets/widgets.dart';

class OldMessage extends StatelessWidget {
  const OldMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: 5,
      itemBuilder: ((context, index) => ClickAnimation(
            onTap: () {},
            child: Column(
              children: [
                const SizedBox(height: 10),
                LineWithCircleRoundConer(
                  isEmptyOne: true,
                  size: size,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  // decoration: const BoxDecoration(color: kWhiteColor),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 8, left: 40.0, right: 40),
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 38,
                          width: 38,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(Assets.transfer),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Transfert reçu",
                              style: themeData.textTheme.bodyText2!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Il ya 2 min",
                              style: themeData.textTheme.bodyText2!.copyWith(
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              "ID: RNK00123",
                              style: themeData.textTheme.bodyText2!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          height: 38,
                          width: 38,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(Assets.user),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
