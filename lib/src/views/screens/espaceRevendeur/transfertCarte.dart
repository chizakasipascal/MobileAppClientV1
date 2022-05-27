// ignore_for_file: file_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobileappclientv1/src/views/widgets/widgets.dart';

import '../../../const/app_theme.dart';
import '../../../utils/utils.dart';
import '../../widgets/buttom/buttom.dart';

class TransfertCarte extends StatefulWidget {
  const TransfertCarte(
      {Key? key, this.postionnedModify = true, this.isEmpty = true})
      : super(key: key);
  final bool postionnedModify;
  final bool isEmpty;

  @override
  State<TransfertCarte> createState() => _TransfertCarteState();
}

class _TransfertCarteState extends State<TransfertCarte> {
  late PageController _pageController;
  double pageOffeset = 0;
  double viewportFraction = 0.8;

  // void _listener() {
  //   setState(() {
  //     _currentPage = _pageController.page;
  //   });
  // }

  @override
  void initState() {
    //  _pageController.addListener(_listener);
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
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: 200,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Padding(
              //     padding: const EdgeInsets.only(left: 8.0),
              //     child: Text(
              //       "Votre cartes",
              //       style: themeData.textTheme.bodyMedium,
              //     )),
              // const SizedBox(height: 10),
              // LineWithCircleRoundConer(
              //   isEmptyOne: true,
              //   size: size,
              //   color: kBlackColor,
              //   mainAxisAlignment: MainAxisAlignment.start,
              // ),
              widget.postionnedModify
                  ? widget.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: 200,
                                  child: PageView.builder(
                                      controller: _pageController,
                                      itemCount: 3,
                                      itemBuilder: (context, index) {
                                        double scale = max(
                                            viewportFraction,
                                            (1 -
                                                (pageOffeset - index).abs() +
                                                viewportFraction));
                                        double angle =
                                            (pageOffeset - index).abs();
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
                                              child:
                                                  Card3DConnectis(size: size),
                                            ));
                                      })

                                  //Card3DConnectis(size: size),
                                  ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: IconButton(
                                      splashRadius: 20,
                                      icon: const Icon(
                                        Icons.remove,
                                        color: kConnectis,
                                      ),
                                      onPressed: () {
                                        debugPrint('-');
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  SizedBox(
                                    width: 140,
                                    height: 30,
                                    child: ConnectisRedButtom(
                                      onPressed: () {
                                        debugPrint('Quantite');
                                      },
                                      descriprion: '12 Cartes',
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: IconButton(
                                      splashRadius: 20,
                                      icon: const Icon(
                                        Icons.add,
                                        color: kConnectis,
                                      ),
                                      onPressed: () {
                                        debugPrint('+');
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                ],
                              ),
                              const SizedBox(height: 10),
                              LineWithCircleRoundConer(
                                isEmptyOne: true,
                                size: size,
                                mainAxisAlignment: MainAxisAlignment.start,
                              ),
                              const SizedBox(height: 10),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: size.width * .5,
                                          height: 60,
                                          child: Card3DConnectis(
                                            size: size,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Container(
                                          height: 35,
                                          width: 35,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: kConnectis,
                                          ),
                                          child: IconButton(
                                            splashRadius: 20,
                                            icon: Center(
                                              child: Text(
                                                "${index + 2}",
                                                style: themeData
                                                    .textTheme.bodyText1!
                                                    .copyWith(
                                                  color: kWhiteColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                            ),
                                            onPressed: () {
                                              debugPrint(
                                                  'quantite ${index + 2}');
                                            },
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              width: 2.0,
                                              color: kConnectis,
                                            ),
                                          ),
                                          child: IconButton(
                                            splashRadius: 20,
                                            icon: const Icon(
                                              Icons.close,
                                              color: kConnectis,
                                            ),
                                            onPressed: () {
                                              debugPrint('X');
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              LineWithCircleRoundConer(
                                isEmptyOne: true,
                                size: size,
                                color: kBlackColor,
                                mainAxisAlignment: MainAxisAlignment.start,
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    "Montant total du Transfert:",
                                    style:
                                        themeData.textTheme.bodyText1!.copyWith(
                                      color: kGreyColor,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Text(
                                    "38",
                                    style:
                                        themeData.textTheme.bodyText1!.copyWith(
                                      color: kConnectis,
                                      fontSize: 25.0,
                                    ),
                                  ),
                                  Text(
                                    "\$",
                                    style:
                                        themeData.textTheme.bodyText1!.copyWith(
                                      color: kGreyColor,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      : CarteConnectisEmpty(size: size)
                  : const SizedBox(height: 200, child: Placeholder()),
              const SizedBox(height: 10),
              LineWithCircleRoundConer(
                isEmptyOne: true,
                size: size,
                color: kBlackColor,
                mainAxisAlignment: MainAxisAlignment.start,
              ),
              const SizedBox(height: 10),
              widget.isEmpty
                  ? TransferAndConfirmtButtom(
                      widget: widget,
                      isEmpty: widget.isEmpty,
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}

//appBar: widget.isEmpty
      //     ? PreferredSize(
      //         preferredSize: const Size.fromHeight(120.0),
      //         child: Stack(
      //           children: [
      //             Image.asset(Assets.logo),
      //           ],
      //         ),
      //       )
      //     : PreferredSize(
      //         preferredSize: const Size.fromHeight(0.0),
      //         child: Stack(
      //           children: [
      //             Image.asset(Assets.logo),
      //           ],
      //         ),
      //       ),

            /* 
                  SizedBox(
                    height: 200,
                    child: PageView.builder(
                      itemCount: cartes.length,
                      controller: _pageController,
                      onPageChanged: (page) {
                        setState(() {
                          _currentPage = page.toInt();
                          debugPrint(_currentPage.toString());
                        });
                      },
                      itemBuilder: (BuildContext context, int index) {
                        final percent = (_currentPage - index);
                        final value = percent.clamp(0.0, 1.0);
                        return _currentPage == index
                            ? Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned(
                                    right: 40,
                                    child: CarteItems(
                                      size: size,
                                      index: index,
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      cartes[index].desc.toString(),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 20.0),
                                    ),
                                  ),
                                ],
                              )
                            : Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.identity()
                                  ..setEntry(3, 2, 0.002)
                                  ..rotateX(
                                    pi * value,
                                  ),
                                child: SizedBox(
                                  height: 200,
                                  child: Stack(
                                    children: [
                                      Image.asset(Assets.carte),
                                      Center(
                                        child: ClipRect(
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                                sigmaX: 1.0, sigmaY: 1.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: kWhiteColor
                                                    .withOpacity(0.5),
                                              ),
                                              child: const SizedBox(
                                                height: double.infinity,
                                                width: double.infinity,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                      },
                    ),
                  ),
           
                
                */

