// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

List<CategoryCar> CarTypesList = [
  CategoryCar(title: "Ride", image: 'assets/images/mini.png'),
  CategoryCar(title: "AC Ride", image: 'assets/images/go.png'),
  CategoryCar(title: "VIP", image: 'assets/images/vip.png'),
  CategoryCar(title: "Bike", image: 'assets/images/bike.png'),
];



class CategoryCar {
  String image;
  String title;

  CategoryCar({this.title, this.image});
}
class CategoryCard extends StatelessWidget {
  CategoryCar data;
  double height;

  CategoryCard({this.data, this.height});

  @override
  Widget build(BuildContext context) {
    return
      Container(
        padding: EdgeInsets.only(
          top: 10
        ),
        margin: EdgeInsets.only(
          right: 15,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.cyan),
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        //padding: EdgeInsets.all(5.0),
          //height: 80,
        width: 100,
        child: Column(
          children: [
            Image.asset(this.data.image,
            height: 40,
            ),
            Text(this.data.title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: "Inter",
                fontWeight: FontWeight.bold,

              ),

            ),
          ],
        )
        );
  }
}