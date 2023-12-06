import 'dart:math';

import 'package:flutter/material.dart';

class DesignModel extends ChangeNotifier {
  final List<Color> gradientColors = [
    const Color.fromARGB(255, 56, 4, 107),
    const Color.fromARGB(255, 138, 64, 210)
  ];
  final beginDirection = Alignment.topLeft;
  final endDirection = Alignment.bottomRight;
  int diceValue = Random().nextInt(6) + 1;

  void generateRandomDice() {
    diceValue = Random().nextInt(6) + 1;
    notifyListeners();
  }
}

class DesignWidgetProvider extends InheritedNotifier {
  final DesignModel model;
  const DesignWidgetProvider({required super.child, required this.model})
      : super(notifier: model);

  static DesignWidgetProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<DesignWidgetProvider>()
        ?.widget;
    return widget is DesignWidgetProvider ? widget : null;
  }

  static DesignWidgetProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DesignWidgetProvider>();
  }

  // @override
  // bool updateShouldNotify(covariant InheritedWidget oldWidget) {
  //   return true;
  // }
}
