import 'dart:ui';

import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:mobileappclientv1/src/const/app_theme.dart';
import 'package:mobileappclientv1/src/utils/colors.dart';
import 'package:mobileappclientv1/src/views/screens/historique/hist.dart';
import 'package:mobileappclientv1/src/views/screens/historique/recap.dart';
import 'package:mobileappclientv1/src/views/widgets/widgets.dart';

class Historique extends StatefulWidget {
  const Historique({Key? key}) : super(key: key);

  @override
  State<Historique> createState() => _HistoriqueState();
}

class _HistoriqueState extends State<Historique> {
  final _controller = PageController();
  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;
  double indexpage = 0.0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: 50,
            color: kGreyColorOpacity,
            child: Center(
              child: SizedBox(
                height: 40,
                width: 200,
                child: Container(
                  decoration: BoxDecoration(
                    color: kWhiteColor.withOpacity(.5),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.center,
                      style: themeData.textTheme.bodySmall!
                          .copyWith(color: kGreyColor),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.transparent,
                        contentPadding: EdgeInsets.fromLTRB(
                          20.0,
                          20.0,
                          30.0,
                          10.0,
                        ),
                        hintText: 'Rechercher',
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(top: 3.0, left: 10),
                          child: Icon(
                            Icons.search,
                            color: kGreyColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  "Statistique de ventes",
                  style: themeData.textTheme.bodyText2!.copyWith(
                    color: kConnectis,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: LineWithCircleRoundConer(
                    isEmptyOne: true,
                    size: size * .4,
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),
                ),
                Text(
                  "MARS, 2022",
                  style: themeData.textTheme.bodyText2!.copyWith(fontSize: 10),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: kWhiteColor.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              IconButton(
                                splashRadius: 20.0,
                                icon: const Icon(Icons.navigate_before),
                                onPressed: () {
                                  debugPrint('$indexpage');
                                  setState(() {
                                    indexpage = _controller.page!.toDouble();
                                    _controller.previousPage(
                                        duration: _kDuration, curve: _kCurve);
                                  });
                                },
                              ),
                              const Text("Graphique des Ventes"),
                              const SizedBox(height: 10, width: 10),
                              Expanded(
                                child: Container(
                                  height: 0.3,
                                  decoration: BoxDecoration(
                                    color: kGreyColor.withOpacity(.5),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(2),
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                splashRadius: 20.0,
                                icon: const Icon(Icons.navigate_next),
                                onPressed: () {
                                  debugPrint('$indexpage');
                                  setState(() {
                                    indexpage = _controller.page!.toDouble();
                                    _controller.nextPage(
                                        duration: _kDuration, curve: _kCurve);
                                  });
                                },
                              )
                            ],
                          ),
                          ExpandablePageView(
                            controller: _controller,
                            physics: const BouncingScrollPhysics(),
                            children: [
                              GrapLineHistorique(
                                widget: Column(
                                  children: const [
                                    Text("line"),
                                  ],
                                ),
                              ),
                              const GrapCircleHistorique(
                                widget: Text("Cic"),
                              ),
                              const MostByCard(
                                widget: Text("Mopst"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                indexpage == 2.0
                    ? const SizedBox.shrink()
                    : Row(
                        children: [
                          Text(
                            "Historique des ventes",
                            style: themeData.textTheme.bodyText2!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: LineWithCircleRoundConer(
                              isEmptyOne: true,
                              size: size * .4,
                              mainAxisAlignment: MainAxisAlignment.start,
                            ),
                          ),
                          Text(
                            "MARS, 2022",
                            style: themeData.textTheme.bodyText2!
                                .copyWith(fontSize: 10),
                          ),
                        ],
                      ),
                const SizedBox(height: 10),
                indexpage == 2.0 ? const SizedBox.shrink() : const Recap()
              ],
            ),
          )
        ],
      ),
    );
  }
}
