// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:foddie_app/Models/Cart.dart';

import 'package:foddie_app/Widgets/BoldText.dart';
import 'package:foddie_app/Widgets/LightText.dart';

class CartPage extends StatefulWidget {
  CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Cart obj = Cart();

  TextEditingController _controller = TextEditingController();

  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
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
                        color: Color.fromARGB(255, 0, 255, 8).withOpacity(0.6),
                        child: Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            BoldText(
              text: "Your Cart Has\n" + CartLists.length.toString() + " item",
              size: 30,
            ),
            Container(
              height: 400,
              width: double.maxFinite,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: CartLists.length,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Slidable(
                        endActionPane:
                            ActionPane(motion: StretchMotion(), children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                //
                                setState(() {
                                  CartLists.removeAt(index);
                                });
                              },
                              child: Container(
                                child: Icon(
                                  Icons.delete,
                                  size: 40,
                                  color: Colors.white,
                                ),
                                margin: EdgeInsets.only(left: 10, right: 20),
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(30)),
                              ),
                            ),
                          ),
                        ]),
                        child: Container(
                          color: Colors.grey.withOpacity(0.4),
                          margin: EdgeInsets.only(bottom: 10),
                          height: 120,
                          width: double.maxFinite,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Container(
                                    height: 120,
                                    width: 120,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                CartLists[index].imagePath))),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    BoldText(text: CartLists[index].title),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    LightText(text: "Quantitiy : 3")
                                  ],
                                ),
                                Spacer(),
                                BoldText(
                                  text: "Rs.",
                                  size: 30,
                                ),
                                BoldText(
                                  text: CartLists[index].price.toString(),
                                  size: 30,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              BoldText(text: "Total - "),
                              Spacer(),
                              BoldText(
                                  /////
                                  ///
                                  text: check
                                      ? obj.getDiscountedPrice().toString()
                                      : "Rs. " + obj.getTotalPrice().toString())
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              LightText(
                                text: "do you have coupon?",
                                size: 17,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          actions: [
                                            GestureDetector(
                                              onTap: () {
                                                print(_controller.text
                                                    .toString());

                                                setState(() {
                                                  if (_controller.text
                                                          .toString() ==
                                                      "12345") {
                                                    check = !check;
                                                  }

                                                  print("Check : " +
                                                      check.toString());
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                child: Center(
                                                    child: BoldText(
                                                  text: "Apply",
                                                  size: 15,
                                                )),
                                                height: 50,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey.shade200,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                              ),
                                            ),
                                            Spacer(),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                child: Center(
                                                    child: BoldText(
                                                  text: "Cancel",
                                                  size: 15,
                                                )),
                                                height: 50,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey.shade200,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                              ),
                                            ),
                                          ],
                                          content: Container(
                                            height: 200,
                                            width: 100,
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 80,
                                                ),
                                                TextFormField(
                                                  controller: _controller,
                                                  decoration: InputDecoration(
                                                      label: BoldText(
                                                        text:
                                                            "Please Enter Coupon",
                                                        size: 15,
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          0))),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                                child: BoldText(
                                  text: "Apply Coupon",
                                  size: 15,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    height: 100,
                    width: double.maxFinite,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    child: Center(
                      child: BoldText(
                        color: Colors.white,
                        size: 30,
                        text: "Checkout",
                      ),
                    ),
                    height: 80,
                    width: 280,
                    color: Colors.green,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CartList {}
