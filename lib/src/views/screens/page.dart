import 'package:flutter/material.dart';
import 'package:mobileappclientv1/src/const/app_theme.dart';
import 'package:mobileappclientv1/src/const/assets.dart';
import 'package:mobileappclientv1/src/const/routes.dart';
import 'package:mobileappclientv1/src/utils/utils.dart';
import 'package:mobileappclientv1/src/views/screens/historique/historique.dart';
import 'package:mobileappclientv1/src/views/screens/screens.dart';
import 'package:mobileappclientv1/src/views/screens/telephone/telephone.dart';
import 'package:mobileappclientv1/src/views/widgets/background.dart';

import 'serviceClient/chat.dart';

class PageNav extends StatefulWidget {
  const PageNav({Key? key}) : super(key: key);

  @override
  State<PageNav> createState() => _PageState();
}

class _PageState extends State<PageNav> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;
  double height = 20.0;
  void _onTappedBar(int value) {
    setState(() {
      _selectedIndex = value;
    });
    _pageController.jumpToPage(value);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BuildBackground(
          viewLogo: false,
        ),
        Scaffold(
          appBar: (_selectedIndex == 1 ||
                  _selectedIndex == 2 ||
                  _selectedIndex == 3)
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(80.0),
                  child: Padding(
                      padding:
                          const EdgeInsets.only(top: 0.0, left: 10, right: 10),
                      child: AppBar(
                        elevation: 0.0,
                        backgroundColor: Colors.transparent,
                        centerTitle: true,
                        title: Text(
                          _selectedIndex == 1
                              ? "Mes tickets"
                              : _selectedIndex == 3
                                  ? "Téléphone"
                                  : "Historique",
                          style: themeData.textTheme.bodyText2!
                              .copyWith(color: kGreyColor, fontSize: 16),
                        ),
                        actions: [
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, Routes.notificationscreen),
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                color: kGreyColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                          )
                        ],
                      )))
              : null,
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: SizedBox(
                  height: height,
                  child: Image.asset(
                    Assets.connectis,
                  ),
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  height: height,
                  child: Image.asset(
                    Assets.chat,
                  ),
                ),
                label: "Chat",
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  height: height,
                  child: Image.asset(
                    Assets.historique,
                  ),
                ),
                label: "Historique",
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  height: height,
                  child: Image.asset(
                    Assets.telephone,
                  ),
                ),
                label: "Telephone",
              ),
            ],
            onTap: _onTappedBar,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            currentIndex: _selectedIndex,
            selectedItemColor: kConnectis,
            unselectedItemColor: kGreyColor,
            unselectedLabelStyle: themeData.textTheme.bodyText2,
            selectedLabelStyle: themeData.textTheme.bodyText2,
          ),
          body: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              EspaceRevendeur(),
              const Chat(),
              const Historique(),
              const Telephone(),
            ],
            onPageChanged: (page) {
              setState(() {
                _selectedIndex = page;
                debugPrint(page.toString());
              });
            },
          ),
        ),
      ],
    );
  }
}
