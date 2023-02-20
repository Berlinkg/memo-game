import 'package:flutter/cupertino.dart';

class Game {
  final String hiddenCartpath = 'assets/images/question.png';
  List<String>? gameImg;

  final List<String> cards_list = [
    'assets/images/circl.png',
    'assets/images/triangle.png',
    'assets/images/circl.png',
    'assets/images/heart.png',
    'assets/images/star.png',
    'assets/images/triangle.png',
    'assets/images/star.png',
    'assets/images/heart.png',
  ];
  List<Map<int, String>> matchCheck = [];
  final int cardCount = 8;

  void initGame() {
    gameImg = List.generate(cardCount, (index) => hiddenCartpath);
  }
}
