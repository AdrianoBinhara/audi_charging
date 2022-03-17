import 'package:audi_charging/widgets/big_text.dart';
import 'package:audi_charging/widgets/small_text.dart';
import 'package:flutter/material.dart';

class GaragePageBody extends StatefulWidget {
  const GaragePageBody({Key? key}) : super(key: key);

  @override
  State<GaragePageBody> createState() => _GaragePageBodyState();
}

class _GaragePageBodyState extends State<GaragePageBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                width: 300,
                margin: EdgeInsets.all(20),
                child: Text("gelp"),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  color: Color(0xFF162731)
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
