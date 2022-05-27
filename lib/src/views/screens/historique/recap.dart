import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mobileappclientv1/src/const/app_theme.dart';
import 'package:mobileappclientv1/src/utils/utils.dart';

class Recap extends StatelessWidget {
  final List<dynamic>? obj;

  const Recap({Key? key, this.obj}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double total = 0.0;

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
        child: Container(
          decoration: BoxDecoration(
            color: kWhiteColor.withOpacity(0.7),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text.rich(
                  TextSpan(
                    style: themeData.textTheme.bodyText2!.copyWith(
                      color: kGreyColor,
                    ),
                    children: [
                      TextSpan(
                        text: 'ID: R00012 :',
                        style: themeData.textTheme.bodyText2!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(
                        text: 'Kabangi Pierre',
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Table(
                  children: const [
                    TableRow(
                      children: [
                        TableCell(
                          child: Center(
                            child: Text(
                              "Cartes",
                            ),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text(
                              "Unités",
                            ),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text(
                              "Quantité",
                            ),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text(
                              "Prix",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(),
              Table(
                border: TableBorder.all(
                  color: kGreyColor,
                  width: 1,
                  style: BorderStyle.none,
                ),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: List.generate(5, (i) {
                  total = 3750;
                  print("TOTAL RECAP : $total");
                  return _buildTableRow();
                }).toList(),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "Total : \$ $total",
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  TableRow _buildTableRow() {
    return TableRow(
      children: [
        TableCell(
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Container(
                height: 35,
                width: 50,
                padding: const EdgeInsets.only(
                  top: 0.8,
                  bottom: 0.8,
                ),
                child: const Text('image'),
              ),
            ),
          ),
        ),
        const TableCell(
          child: Center(
            child: Text(
              "  Cartes",
            ),
          ),
        ),
        const TableCell(
          child: Center(
            child: Text(
              " product  ",
            ),
          ),
        ),
        const TableCell(
          child: Center(
            child: Text(
              "  qte",
            ),
          ),
        ),
      ],
    );
  }
}
