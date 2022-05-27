import 'package:flutter/material.dart';
import 'package:mobileappclientv1/src/const/app_theme.dart';
import 'package:mobileappclientv1/src/utils/utils.dart';
import 'package:mobileappclientv1/src/views/screens/serviceClient/notification/notif.dart';
import 'package:mobileappclientv1/src/views/widgets/widgets.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  double width = 100;
  int indexPage = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BuildBackground(
          viewLogo: false,
        ),
        Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80.0),
            child: Padding(
              padding: const EdgeInsets.only(top: 0.0, left: 10, right: 10),
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                leading: IconButton(
                  splashRadius: 25.0,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 2.0),
                    child: Container(
                      height: 20.0,
                      color: kGreyColor,
                    ),
                  ),
                ),
                centerTitle: true,
                title: Text(
                  "Notifications",
                  style: themeData.textTheme.bodyText2!
                      .copyWith(color: kGreyColor, fontSize: 16),
                ),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: kGreyColorOpacity,
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
                        color:
                            indexPage == 2 ? Colors.transparent : kWhiteColor,
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
                                "Nouveaux",
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
                                "Ouvertes",
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
                        NewMessage(),
                        OldMessage(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
