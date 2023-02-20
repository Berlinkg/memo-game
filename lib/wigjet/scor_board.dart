import 'package:flutter/material.dart';

Widget ScorBoard(String title, String info) {
  return Expanded(
    child: Container(
      margin: EdgeInsets.all(26.0),
      padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 17.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(14.0)),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 06.0,
          ),
          Text(
            info,
            style: TextStyle(
              fontSize: 34.0,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    ),
  );
}
