// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:foddie_app/Models/Product.dart';
import 'package:foddie_app/Widgets/BoldText.dart';
import 'package:foddie_app/Widgets/LightText.dart';

class SearchPage extends StatefulWidget {
  SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool check = false;
  Product obj = Product(
      imagePath: "",
      title: "",
      starLength: 0,
      comments: "",
      description: "",
      price: 0);

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    controller: _controller,
                    decoration: InputDecoration(
                        label: BoldText(text: "Search"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  )),
                  SizedBox(
                    width: 20,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: GestureDetector(
                      onTap: () {
                        obj = Search(_controller.text);

                        print(obj.comments);

                        if (obj.imagePath == "1") {
                          setState(() {
                            check = false;
                          });
                        } else {
                          setState(() {
                            check = true;
                          });
                        }
                      },
                      child: Container(
                          color: Colors.green,
                          height: 50,
                          width: 50,
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ],
              ),
            ),
            check
                ? Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      height: 120,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Container(
                              height: 160,
                              width: 80,
                              child: Image.asset(
                                obj.imagePath,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Spacer(),
                            Column(
                              children: [
                                BoldText(text: obj.title),
                                Row(
                                  children: [
                                    BoldText(text: "\$ "),
                                    BoldText(text: obj.price.toString()),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                : Container(
                    child: obj.imagePath == "1"
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BoldText(text: "Not Found  "),
                              Icon(
                                Icons.not_interested_outlined,
                                color: Colors.red,
                                size: 40,
                              ),
                            ],
                          )
                        : Row(),
                  ),
          ],
        ),
      ),
    );
  }
}
