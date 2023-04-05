import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String word1;
  final String word2;

  const CustomAppBar({required this.word1, required this.word2});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: word1,
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
          children: [
            TextSpan(
              text: '$word2',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
