import 'package:flutter/material.dart';
import 'package:mobileappclientv1/src/const/app_theme.dart';
import 'package:mobileappclientv1/src/const/assets.dart';
import 'package:mobileappclientv1/src/utils/utils.dart';

class CarteConnectisEmpty extends StatelessWidget {
  const CarteConnectisEmpty({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 6,
      width: size.width,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 30),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: size.height / 4,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            Assets.carteEmpty,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Text.rich(
                      TextSpan(
                        style: themeData.textTheme.bodyText2,
                        children: [
                          const TextSpan(
                            text: "Vous n’avez aucune ",
                          ),
                          TextSpan(
                            text: "\nCarte Tchukudu",
                            style: themeData.textTheme.bodyText2!.copyWith(
                                fontWeight: FontWeight.bold, color: kConnectis),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
