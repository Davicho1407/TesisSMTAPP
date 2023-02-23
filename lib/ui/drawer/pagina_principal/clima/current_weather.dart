import 'package:flutter/material.dart';

Widget currentWeather(
    IconData icon, String temp, String location, String country) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.orange, size: 64.0),
        SizedBox(
          height: 10,
        ),
        Text(
          '$temp',
          style: TextStyle(fontSize: 46),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '$location' '$country',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        )
      ],
    ),
  );
}
