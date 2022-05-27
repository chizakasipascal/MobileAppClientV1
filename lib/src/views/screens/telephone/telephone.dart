import 'package:flutter/material.dart';
import 'package:mobileappclientv1/src/const/app_theme.dart';
import 'package:mobileappclientv1/src/utils/utils.dart';
import 'package:mobileappclientv1/src/views/screens/telephone/tele.dart';

class Telephone extends StatefulWidget {
  const Telephone({Key? key}) : super(key: key);

  @override
  State<Telephone> createState() => _TelephoneState();
}

class _TelephoneState extends State<Telephone> {
  double width = 100;
  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: DefaultTabController(
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: indexPage == 2 ? Colors.transparent : kGreyColorOpacity,
              ),
              padding: const EdgeInsets.only(
                top: 5,
                bottom: 5,
              ),
              margin: const EdgeInsets.only(right: 5, top: 5),
              child: TabBar(
                isScrollable: true,
                onTap: (index) {
                  indexPage = index;
                  debugPrint('$indexPage');
                  setState(() {});
                },
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: indexPage == 2 ? Colors.transparent : kWhiteColor,
                ),
                labelPadding: const EdgeInsets.only(left: 5, right: 5),
                labelStyle: themeData.textTheme.bodyText2,
                tabs: [
                  Tab(
                    child: Container(
                      width: width,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Call Center",
                          style: themeData.textTheme.bodyText2!
                              .copyWith(fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      width: width,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Vos Contactes",
                          style: themeData.textTheme.bodyText2!
                              .copyWith(fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  CallCenter(),
                  Contacts(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
