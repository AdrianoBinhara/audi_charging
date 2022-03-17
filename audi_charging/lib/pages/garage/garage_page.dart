import 'package:audi_charging/widgets/big_text.dart';
import 'package:audi_charging/widgets/small_text.dart';
import 'package:flutter/material.dart';

import 'garage_page_body.dart';

class GaragePage extends StatefulWidget {
  const GaragePage({Key? key}) : super(key: key);

  @override
  State<GaragePage> createState() => _GaragePageState();
}

class _GaragePageState extends State<GaragePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 45, bottom: 15),
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Row(
            children: [BigText(color: Colors.white, text: "My Garage", size: 23)],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: GaragePageBody(),
          ),
        )
      ],
    );
  }
}
