import 'package:flutter/material.dart';
import '../../screens/espaceClient/transfertCarte.dart';
import '../widgets.dart';

class TransferAndConfirmtButtom extends StatelessWidget {
  final bool isEmpty;
  final String descriprion;
  final VoidCallback? onPressed;
  const TransferAndConfirmtButtom({
    Key? key,
    required this.widget,
    required this.isEmpty,
    this.descriprion = 'Transfert',
    this.onPressed,
  }) : super(key: key);

  final TransfertCarte widget;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isEmpty ? Alignment.bottomLeft : Alignment.bottomCenter,
      child: ConnectisRedButtom(
        onPressed: () {
          !isEmpty ? debugPrint('non Transfert') : debugPrint('ok Transfert');
        },
        descriprion: descriprion,
      ),
    );
  }
}
