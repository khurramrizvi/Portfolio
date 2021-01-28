import 'package:flutter/cupertino.dart';

class UtilityProvider with ChangeNotifier {
  ScrollController scrollController = new ScrollController();
  double cardElevation = 30;

  getCardElevation() => cardElevation;

  getScrollController() => scrollController;

  changeElevation(double elevation) {
    cardElevation = elevation;
    notifyListeners();
  }
}
