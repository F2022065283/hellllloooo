import 'package:flutter/material.dart';
import 'package:foddie_app/Models/Product.dart';
import 'package:foddie_app/Widgets/BoldText.dart';
import 'package:foddie_app/Widgets/LightText.dart';

class BottomBuilder extends StatelessWidget {
  const BottomBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 365,
      width: double.maxFinite,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 4,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, top: 20),
                  height: 140,
                  width: 170,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(Products[index].imagePath)),
                      borderRadius: BorderRadius.circular(30)),
                ),
                SizedBox(
                  width: 3,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BoldText(
                      text: Products[index].title,
                      size: 24,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        LightText(
                          text: Products[index].description,
                          size: 16,
                          color: Colors.grey,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: Colors.yellow,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            LightText(
                              text: "Normal",
                              size: 15,
                            ),
                          ],
                        ),

                        // second row
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Color.fromARGB(255, 0, 255, 8),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            LightText(
                              text: "1.7",
                              size: 15,
                            ),
                          ],
                        ),

                        // 3rd row
                        Row(
                          children: [
                            Icon(
                              Icons.alarm,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            LightText(
                              text: "32 Mins",
                              size: 15,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ],
            );
          }),
    );
  }
}
