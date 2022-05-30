import 'package:flutter/material.dart';
import 'package:mobileappclientv1/src/const/app_theme.dart';
import 'package:mobileappclientv1/src/const/assets.dart';
import 'package:mobileappclientv1/src/views/widgets/widgets.dart';

class EspaceClient extends StatefulWidget {
  EspaceClient(
      {Key? key,
      this.carteEmpty = false,
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
                        appname: "Espace Client",
                        size: size,
                        widget: true,
                        headLabel: 'Bonjour ',
                        labelname: 'Claude',
                        subLabel: 'Bienvenu dans votre ')
                    : PostionnedWidgetColumnLeft(
                        appname: "Espace Client",
                        size: size,
                        widget: true,
                        headLabel: 'Bonjour ',
                        labelname: 'Claude',
                        subLabel: 'Vous êtes sur le point de transférer des '),
                const SizedBox(height: 10),
                widget.carteEmpty
                    ? Text("Utilisation", style: themeData.textTheme.bodyText2)
                    : Text("Votre cartes",
                        style: themeData.textTheme.bodyText2),
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
                        height: 200,
                        child: Row(
                          children: const [],
                        )),
                const SizedBox(height: 10),
                LineWithCircleRoundConer(
                  isEmptyOne: true,
                  size: size,
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
