import 'package:flutter/material.dart';

import '../../widgets/dialoCall.dart';

class Contacts extends StatelessWidget {
  const Contacts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DialogCall(
          size: size,
        )
      ],
    );
  }
}
