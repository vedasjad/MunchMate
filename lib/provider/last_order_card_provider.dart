import 'package:flutter/material.dart';

class LastOrderCardProvider extends ChangeNotifier {
  List<bool> _expandCardList = [];

  void fillExpandCardList(int noOfCards) {
    _expandCardList = List.generate(noOfCards, (index) => false);
  }

  void toggleCard(int index) {
    _expandCardList[index] = !_expandCardList[index];
    notifyListeners();
  }

  get expandCardList => _expandCardList;
}
