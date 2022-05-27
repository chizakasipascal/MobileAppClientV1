import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mobileappclientv1/src/const/app_theme.dart';
import 'package:mobileappclientv1/src/const/assets.dart';
import 'package:mobileappclientv1/src/utils/utils.dart';
import 'package:mobileappclientv1/src/views/widgets/widgets.dart';

class EspaceClient extends StatefulWidget {
  EspaceClient(
      {Key? key,
      this.carteEmpty = true,
      this.carteNotSelect = false,
      this.carteSelect = false})
      : super(key: key);

  final bool carteEmpty;
  bool carteNotSelect;
  bool carteSelect;

  @override
  State<EspaceClient> createState() => _EspaceClientState();
}

class _EspaceClientState extends State<EspaceClient> {
  late PageController _pageController;
  double pageOffeset = 0;
  double viewportFraction = 0.8;

  @override
  void initState() {
    _pageController =
        PageController(initialPage: 0, viewportFraction: viewportFraction)
          ..addListener(() {
            setState(() {
              pageOffeset = _pageController.page!;
            });
          });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.carteEmpty == true) {
      widget.carteSelect = false;
      widget.carteNotSelect = true;
    }
    if (widget.carteSelect) {
      widget.carteNotSelect = false;
    }
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: [
          widget.carteSelect
              ? const SizedBox.shrink()
              : Positioned(
                  top: -10,
                  left: -10,
                  child: SizedBox(
                    height: 130,
                    child: Image.asset(Assets.logo),
                  ),
                ),
          Padding(
            padding: const EdgeInsets.only(
              top: 150.0,
              left: 20,
              right: 20,
              bottom: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.carteNotSelect
                    ? PostionnedWidgetColumnCenter(
                        appname: "ESPACE REVENDEUR",
                        size: size,
                        widget: true,
                        headLabel: 'Bonjour ',
                        labelname: 'Claude',
                        subLabel: 'Bienvenu dans votre ')
                    : PostionnedWidgetColumnLeft(
                        appname: "ESPACE REVENDEUR",
                        size: size,
                        widget: true,
                        headLabel: 'Bonjour ',
                        labelname: 'Claude',
                        subLabel: 'Vous êtes sur le point de transférer des '),
                const SizedBox(height: 10),
                widget.carteEmpty
                    ? Text(
                        "Votre cartes",
                        style: themeData.textTheme.bodyText2!
                            .copyWith(color: kGreyColor),
                      )
                    : Row(
                        children: [
                          SizedBox(
                            width: 40,
                            height: 20,
                            child: Image.asset(Assets.transfert),
                          ),
                          Text.rich(
                            TextSpan(
                              style: themeData.textTheme.bodyText2!.copyWith(
                                color: kGreyColor,
                              ),
                              children: [
                                const TextSpan(
                                  text: "Transferer les Cartes ",
                                ),
                                TextSpan(
                                  text: "Tchukudu",
                                  style:
                                      themeData.textTheme.bodyText2!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: kConnectis,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                const SizedBox(height: 10),
                LineWithCircleRoundConer(
                  isEmptyOne: true,
                  size: size,
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
                const SizedBox(height: 10),
                widget.carteEmpty
                    ? CarteConnectisEmpty(size: size)
                    : SizedBox(
                        height: 250,
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: 3,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            debugPrint('$pageOffeset');
                            double scale = max(
                                viewportFraction,
                                (1 -
                                    (pageOffeset - index).abs() +
                                    viewportFraction));
                            double angle = (pageOffeset - index).abs();
                            if (angle > 0.5) {
                              angle = 1 - angle;
                            }
                            return Container(
                              color: Colors.green,
                              padding: EdgeInsets.only(
                                  right: 10,
                                  left: 0,
                                  top: 100 - (scale * 25),
                                  bottom: 50),
                              child: Transform(
                                transform: Matrix4.identity()
                                  ..setEntry(3, 2, 0.001)
                                  ..rotateY(angle),
                                alignment: Alignment.center,
                                child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        widget.carteSelect !=
                                            widget.carteSelect;
                                      });
                                    },
                                    child: Card3DConnectis(size: size)),
                              ),
                            );
                          },
                        ),
                      ),
                const SizedBox(height: 10),
                LineWithCircleRoundConer(
                  isEmptyOne: true,
                  size: size,
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
                widget.carteSelect
                    ? Container(
                        color: Colors.black,
                        child: ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: ((context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 200,
                                      child: Placeholder(),
                                    ),
                                    const Spacer(),
                                    Row(
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 40,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: kConnectis,
                                          ),
                                          child: Center(
                                            child: Text(
                                              '$index',
                                              style: const TextStyle(
                                                color: kWhiteColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        InkWell(
                                          onTap: () {
                                            debugPrint('$index');
                                          },
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border:
                                                  Border.all(color: kConnectis),
                                              //color: kWhiteColor,
                                            ),
                                            child: const Icon(
                                              Icons.close,
                                              color: kConnectis,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      )
                    : const SizedBox.shrink(),
                const SizedBox(height: 10),
                widget.carteEmpty
                    ? const SizedBox.shrink()
                    : LineWithCircleRoundConer(
                        isEmptyOne: true,
                        size: size,
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                widget.carteEmpty
                    ? const SizedBox.shrink()
                    : Align(
                        alignment: widget.carteNotSelect
                            ? Alignment.bottomLeft
                            : Alignment.bottomCenter,
                        child: ConnectisRedButtom(
                          onPressed: () {
                            widget.carteSelect
                                ? debugPrint('ok Transfert')
                                : debugPrint('non Transfert');
                          },
                          descriprion: 'descriprion',
                        ),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:mobileapprevv3/src/const/app_theme.dart';
// import 'package:mobileapprevv3/src/const/assets.dart';
// import 'package:mobileapprevv3/src/utils/colors.dart';
// import 'package:mobileapprevv3/src/views/screens/espaceRevendeur/confirmeTransfert.dart';
// import 'package:mobileapprevv3/src/views/screens/espaceRevendeur/transfertCarte.dart';
// import 'package:mobileapprevv3/src/views/widgets/appBarConnectisWithUserAndApplicationName.dart';
// import 'package:mobileapprevv3/src/views/widgets/lineWithCircleRoundConer.dart';

// class EspaceRevendeur extends StatefulWidget {
//   const EspaceRevendeur({Key? key}) : super(key: key);

//   @override
//   State<EspaceRevendeur> createState() => _EspaceRevendeurState();
// }

// class _EspaceRevendeurState extends State<EspaceRevendeur> {
//   final PageController _pageController = PageController();
//   int _selectedIndex = 0;
//   double height = 20.0;
//   void _onTappedBar(int value) {
//     setState(() {
//       _selectedIndex = value;
//     });
//     _pageController.jumpToPage(value);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(200.0),
//         child: Container(
//           padding: const EdgeInsets.all(10),
//           //color: Colors.deepOrange,
//           child: Column(children: [
//             AppBarConnectisWithUserAndApplicationName(
//               size: size,
//               labelname: "Claude ",
//               avatarProfil: false, // Check si la personne possede un avatar
//               postionnedModify: true,
//             ),
//             const SizedBox(height: 10),
//             Padding(
//               padding: const EdgeInsets.only(left: 8.0),
//               child: Row(
//                 children: [
//                   SizedBox(
//                     height: 20,
//                     width: 40,
//                     child: Image.asset(Assets.transfert),
//                   ),
//                   const SizedBox(width: 10),
//                   Text.rich(
//                     TextSpan(
//                       style: themeData.textTheme.bodyText2!.copyWith(
//                         fontSize: 16,
//                         color: kGreyColor,
//                       ),
//                       children: [
//                         const TextSpan(
//                           text: "Transferer les Cartes ",
//                         ),
//                         TextSpan(
//                           text: "Tchukudu",
//                           style: themeData.textTheme.bodyText2!.copyWith(
//                             fontWeight: FontWeight.bold,
//                             color: kConnectis,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 10),
//             LineWithCircleRoundConer(
//               isEmptyOne: true,
//               size: size,
//               color: kBlackColor,
//               mainAxisAlignment: MainAxisAlignment.start,
//             )
//           ]),
//         ),
//       ),
//       body: PageView(
//         controller: _pageController,
//         // physics: const NeverScrollableScrollPhysics(),
//         children: const <Widget>[
//           TransfertCarte(),
//           ConfirmeTransfert(),
//         ],
//         onPageChanged: (page) {
//           setState(
//             () {
//               _selectedIndex = page;
//               debugPrint(page.toString());
//             },
//           );
//         },
//       ),
//     );
//   }
// }
