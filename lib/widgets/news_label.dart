import 'package:flutter/material.dart';

class NewsLabel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: Colors.transparent,
          margin: EdgeInsets.only(
              left: 58, top: 41 - 10, bottom: 33),
          child: Text(
            'News',
            style: TextStyle(
              color: Color(0xFF252627),
              fontSize: 18,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
        Spacer()
      ],
    );
  }
}