import 'package:flutter/material.dart';
import 'package:mobileappclientv1/src/const/app_theme.dart';
import 'package:mobileappclientv1/src/const/assets.dart';
import 'package:mobileappclientv1/src/utils/utils.dart';
import 'package:mobileappclientv1/src/views/widgets/widgets.dart';

class TicketFerme extends StatelessWidget {
  const TicketFerme({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: ((context, index) => ClickAnimation(
            onTap: () {},
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 70,
              margin: const EdgeInsets.only(top: 5),
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0, 3),
                  blurRadius: 3,
                )
              ], color: kWhiteColor),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const CircleAvatar(
                      radius: 45,
                      backgroundColor: kConnectis,
                    ),
                    SizedBox(
                      height: 28.87,
                      width: 30.39,
                      child: Image.asset(Assets.flag),
                    ),
                    const SizedBox(width: 5),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ticket ouvert',
                          style: themeData.textTheme.bodyText2!.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          '#21821',
                          style: themeData.textTheme.bodyText2!
                              .copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '15:33',
                          style: themeData.textTheme.bodyText2!
                              .copyWith(fontSize: 14),
                        ),
                        Text(
                          '12 Fév. 2020',
                          style: themeData.textTheme.bodyText2!
                              .copyWith(fontSize: 14),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
