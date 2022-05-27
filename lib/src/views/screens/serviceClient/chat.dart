import 'package:flutter/material.dart';
import 'package:mobileappclientv1/src/const/app_theme.dart';
import 'package:mobileappclientv1/src/const/assets.dart';
import 'package:mobileappclientv1/src/utils/utils.dart';
import '../../../const/app_theme.dart';
import '../screens.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  double width = 100;
  int indexPage = 0;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: DefaultTabController(
        length: 3,
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
                          "Ouvert",
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
                          "Fermé",
                          style: themeData.textTheme.bodyText2!
                              .copyWith(fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                              indexPage == 2 ? kConnectis : Colors.transparent,
                              BlendMode.srcATop),
                          child: Image.asset(Assets.edit),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const TicketsOuvert(),
                  const TicketFerme(),
                  CreerTicket()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
