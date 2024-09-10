import 'package:flutter/material.dart';
import 'package:foddie_app/Models/Product.dart';
import 'package:foddie_app/Pages/DetailedViewPage.dart';
import 'package:foddie_app/Widgets/BoldText.dart';
import 'package:foddie_app/Widgets/LightText.dart';

class TopBuilder extends StatelessWidget {
  const TopBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 330,
        width: double.maxFinite,
        child: ListView.builder(
            itemCount: Products.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailedViewPage(
                              Comments: Products[index].comments,
                              Title: Products[index].title,
                              StarLength: Products[index].starLength,
                              Description: Products[index].description,
                              Price: Products[index].price,
                              ImagePath: Products[index].imagePath)));
                },
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      height: 250,
                      width: 370,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(Products[index].imagePath)),
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 180, left: 30),
                      height: 110,
                      width: 300,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 3),
                                blurRadius: 15,
                                color: Colors.black.withOpacity(0.2))
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BoldText(text: Products[index].title),
                            Row(
                              children: [
                                Row(
                                  children: List.generate(5, (startIndex) {
                                    return Icon(Icons.star,
                                        size: 15,
                                        color: startIndex <
                                                Products[index].starLength
                                            ? Colors.yellow
                                            : Colors.grey);
                                  }),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                BoldText(
                                  text: "{" +
                                      Products[index].starLength.toString() +
                                      "}",
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                BoldText(
                                  text: Products[index].comments,
                                  size: 16,
                                )
                              ],
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
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 110),
                      child: Row(
                        children: List.generate(4, (MMIndex) {
                          return Container(
                            margin: EdgeInsets.only(right: 10, top: 305),
                            height: 15,
                            width: MMIndex == index ? 30 : 15,
                            decoration: BoxDecoration(
                                color: MMIndex == index
                                    ? Color.fromARGB(255, 0, 255, 8)
                                    : Colors.grey.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(30)),
                          );
                        }),
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
