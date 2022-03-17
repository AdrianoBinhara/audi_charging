import 'package:audi_charging/pages/garage/garage_page.dart';
import 'package:audi_charging/widgets/icon_and_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'dart:math' as math;

const MAPBOX_ACESS_TOKEN =
    'pk.eyJ1IjoiYmluaGFyYSIsImEiOiJjbDBwb3JxZWwxbTdiM2NvMHRldDluYm5jIn0.oAWIuncvJpWlKanJZFEniQ';
const MAPBOX_STYLE = 'mapbox/dark-v10';

enum BottomIcons { ChargeCar, Map, Plug, Settings }

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  int selectedIndex = 0;
  List<IconData> data = [
    Icons.electric_car_outlined,
    Icons.map_outlined,
    Icons.electrical_services,
    Icons.settings_outlined,
  ];

  BottomIcons bottomIcons = BottomIcons.ChargeCar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF203745),
      body: Stack(
        children: [
          bottomIcons == BottomIcons.Map
              ? Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                        bottomRight: Radius.circular(35),
                      ),
                      child: FlutterMap(
                        options: MapOptions(
                          minZoom: 5,
                          maxZoom: 16,
                          zoom: 13,
                        ),
                        nonRotatedLayers: [
                          TileLayerOptions(
                              urlTemplate:
                                  'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
                              additionalOptions: {
                                'accessToken': MAPBOX_ACESS_TOKEN,
                                'id': MAPBOX_STYLE,
                              })
                        ],
                      ),
                    ),
                    Positioned(
                      top: 70,
                      left: 30,
                      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Container(
                          height: 55,
                          width: 270,
                          padding: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(25)),
                              color: Colors.black.withOpacity(0.8)),
                          child: IconAndTextWidget(
                            icon: Icons.search_outlined,
                            text: "Search Location",
                            iconColor: Colors.grey.shade400,
                          ),
                        ),
                        const SizedBox(width: 20),
                        //more button
                        FloatingActionButton(
                          backgroundColor: Colors.black.withOpacity(.8),
                          child: Icon(
                            Icons.more_horiz_sharp,
                            color: Colors.white,
                          ),
                          onPressed: () => {},
                        ),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15, right: 15),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: FloatingActionButton(
                          onPressed: () => {},
                          elevation: 2.0,
                          backgroundColor: Colors.black,
                          child: Transform.rotate(
                            angle: -45 * math.pi / 180,
                            child: Icon(
                              Icons.send_rounded,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Container(),
          bottomIcons == BottomIcons.ChargeCar ? GaragePage() : Container(),
        ],
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }

  Container BottomNavbar() {
    return Container(
      padding: EdgeInsets.only(bottom: 25, top: 10, left: 20, right: 20),
      height: 120,
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(20),
        color: Colors.black,
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (ctx, i) => Row(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    i == selectedIndex ? Color(0xFF3AE1C4).withOpacity(.6) : Colors.transparent,
                    Colors.transparent
                  ], begin: Alignment.topCenter, end: Alignment.center),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = i;
                          bottomIcons = BottomIcons.values[i];
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        width: 50,
                        child: Container(
                          decoration: BoxDecoration(
                            color: i == selectedIndex ? Color(0xFF3AE1C4) : Colors.transparent,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(2), bottomRight: Radius.circular(2)),
                          ),
                          height: 3,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 23,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = i;
                          bottomIcons = BottomIcons.values[i];
                        });
                      },
                      child: AnimatedContainer(
                          duration: Duration(milliseconds: 250),
                          width: 50,
                          decoration: BoxDecoration(
                            border: i == selectedIndex
                                ? Border(
                                    top: BorderSide(
                                      width: 3.0,
                                      color: Colors.transparent,
                                    ),
                                  )
                                : null,
                          ),
                          child: Icon(data[i],
                              size: 35,
                              color:
                                  i == selectedIndex ? Color(0xFF3AE1C4) : Colors.grey.shade600)),
                    ),
                  ],
                ),
              ),
            ),
          ]),
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
