import 'package:flutter/material.dart';
import 'package:foddie_app/Models/Cart.dart';
import 'package:foddie_app/Models/CartItems.dart';

import 'package:foddie_app/Pages/CartPage.dart';
import 'package:foddie_app/Widgets/BoldText.dart';
import 'package:foddie_app/Widgets/LightText.dart';

// ignore: must_be_immutable
class DetailedViewPage extends StatefulWidget {
  DetailedViewPage({
    super.key,
    required this.Comments,
    required this.Title,
    required this.StarLength,
    required this.Description,
    required this.Price,
    required this.ImagePath,
  });

  String ImagePath;
  String Title;
  int StarLength;
  String Comments;
  String Description;
  int Price;

  @override
  State<DetailedViewPage> createState() => _DetailedViewPageState();
}

class _DetailedViewPageState extends State<DetailedViewPage> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                    height: 270,
                    width: double.maxFinite,
                    child: Image.asset(
                      widget.ImagePath,
                      fit: BoxFit.cover,
                    )),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            height: 45,
                            width: 45,
                            color: Colors.white,
                            child: Icon(Icons.arrow_back_ios_new_rounded),
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CartPage()));
                          },
                          child: Container(
                            height: 45,
                            width: 45,
                            color: Colors.white,
                            child: Icon(Icons.shopping_cart_outlined),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 240),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    child: Container(
                      height: 625,
                      width: double.maxFinite,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 120,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                  //color: Colors.red,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BoldText(
                                    text: widget.Title,
                                    size: 30,
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children:
                                            List.generate(5, (startIndex) {
                                          return Icon(Icons.star,
                                              size: 15,
                                              color:
                                                  startIndex < widget.StarLength
                                                      ? Colors.yellow
                                                      : Colors.grey);
                                        }),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      BoldText(
                                        text: "{" +
                                            widget.StarLength.toString() +
                                            "}",
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      BoldText(
                                        text: widget.Comments,
                                        size: 16,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                            color:
                                                Color.fromARGB(255, 0, 255, 8),
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
                            BoldText(
                              text: "Introduce",
                              size: 30,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            LightText(text: widget.Description),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                LightText(
                                  text: "Show More",
                                  color: Color.fromARGB(255, 0, 255, 8),
                                ),
                                Icon(Icons.arrow_drop_down,
                                    color: Color.fromARGB(255, 0, 255, 8))
                              ],
                            ),
                            Spacer(),
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(Icons.remove),
                                          LightText(text: "1"),
                                          Icon(Icons.add),
                                        ],
                                      ),
                                      height: 70,
                                      width: 130,
                                      color: Colors.grey.withOpacity(0.2)),
                                ),
                                Spacer(),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        CartLists.add(CartItem(
                                            imagePath: widget.ImagePath,
                                            title: widget.Title,
                                            quantity: 1,
                                            price: widget.Price));
                                        isAdded = !isAdded;
                                      });
                                    },
                                    child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15, right: 15),
                                          child: isAdded
                                              ? Center(
                                                  child: BoldText(
                                                      text: "Added To Cart"))
                                              : Row(
                                                  children: [
                                                    BoldText(
                                                      text: "Rs.",
                                                      color: Colors.white,
                                                    ),
                                                    BoldText(
                                                        text: widget.Price
                                                            .toString(),
                                                        color: Colors.white),
                                                    Spacer(),
                                                    BoldText(
                                                        text: "Add to Cart",
                                                        color: Colors.white),
                                                  ],
                                                ),
                                        ),
                                        height: 70,
                                        width: 220,
                                        color: Color.fromARGB(255, 0, 255, 8)
                                            .withOpacity(0.4)),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
