import 'package:flutter/material.dart';
import 'package:mobileappclientv1/src/const/app_theme.dart';
import 'package:mobileappclientv1/src/utils/colors.dart';
import 'package:mobileappclientv1/src/views/widgets/click_animation.dart';

class CreerTicket extends StatelessWidget {
  CreerTicket({
    Key? key,
  }) : super(key: key);

  List<String> ticket = [
    'J’ai un problème de connexion',
    'J’ai un problème d’activation',
    'J’ai un problème administratif',
    'J’ai un problème de facturation',
    'J’ai un autre problème',
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ticket.length,
      itemBuilder: ((context, index) => ClickAnimation(
            onTap: () {
              debugPrint(ticket[index]);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                padding: const EdgeInsets.only(bottom: 3),
                height: 70,
                color: kWhiteColor,
                child: Center(
                  child: Text(
                    ticket[index],
                    style: themeData.textTheme.bodyText2,
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
