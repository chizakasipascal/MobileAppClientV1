import 'package:flutter/material.dart';
import 'package:mobileappclientv1/src/const/app_theme.dart';
import 'package:mobileappclientv1/src/const/assets.dart';
import 'package:mobileappclientv1/src/utils/utils.dart';
import 'package:mobileappclientv1/src/views/widgets/click_animation.dart';

class TicketsOuvert extends StatelessWidget {
  const TicketsOuvert({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 28.87,
                          width: 30.39,
                          child: Image.asset(Assets.run),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          '#21821',
                          style: themeData.textTheme.bodyText2!
                              .copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        Text(
                          'Ticket ouvert',
                          style: themeData.textTheme.bodyText2!.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              constraints: const BoxConstraints(
                                  minHeight: 17, minWidth: 17),
                              decoration: const BoxDecoration(
                                color: kConnectis,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  '7',
                                  style: themeData.textTheme.bodyText2!
                                      .copyWith(
                                          color: kWhiteColor, fontSize: 12),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '15:33',
                              style: themeData.textTheme.bodyText2!
                                  .copyWith(fontSize: 14),
                            ),
                          ],
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
