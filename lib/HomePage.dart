// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:foddie_app/Models/Product.dart';
import 'package:foddie_app/Pages/SearchPage.dart';
import 'package:foddie_app/Widgets/BoldText.dart';
import 'package:foddie_app/Widgets/BottomBuilder.dart';
import 'package:foddie_app/Widgets/LightText.dart';
import 'package:foddie_app/Widgets/TopBuilder.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BoldText(
                        text: "Pakistan",
                        color: const Color.fromARGB(255, 0, 255, 8),
                        size: 25,
                      ),
                      Row(
                        children: [
                          BoldText(
                            text: "Lahore",
                            size: 15,
                          ),
                          Icon(Icons.arrow_drop_down)
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: GestureDetector(
                      onTap: () {
                        print(Products.length);
                      },
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SearchPage();
                          }));
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          color: Color.fromARGB(255, 0, 255, 8),
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            TopBuilder(),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  BoldText(
                    text: "Popular",
                    size: 23,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  LightText(
                    text: "Food Pairing",
                    size: 15,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            BottomBuilder(),
          ],
        ),
      ),
    );
  }
}
