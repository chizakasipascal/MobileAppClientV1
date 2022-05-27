import 'package:flutter/material.dart';
import 'package:mobileappclientv1/src/const/assets.dart';

class BuildBackground extends StatelessWidget {
  final String image;

  final bool viewLogo;
  const BuildBackground(
      {Key? key, this.image = Assets.imageBackground, this.viewLogo = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        // Center(
        //   child: ClipRect(
        //     child: BackdropFilter(
        //       filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
        //       child: Container(
        //         decoration: BoxDecoration(
        //           color: kWhiteColor.withOpacity(0.5),
        //         ),
        //         child: const SizedBox(
        //           height: double.infinity,
        //           width: double.infinity,
        //           //  child: widget,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        viewLogo
            ? Positioned(
                top: -10.0,
                child: Container(
                  height: size.height / 5,
                  width: size.width / 2,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        Assets.logo,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
