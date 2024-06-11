import 'package:dynamic_tabview/list_home.dart';
import 'package:flutter/material.dart';

class HomeController {
  //! Cosider as list from api
  List<String> planName = [
    "Full talk time",
    "Unlimited Data",
    "Basic Plan",
    "Family Plan",
  ];

  List<Widget> tabWidgets = [];
  //!  assign list text to widgt and return
  List<Widget> fetchTitleWidget() {
    tabWidgets.clear();
    for (String name in planName) {
      tabWidgets.add(Text(name));
    }
    return tabWidgets;
  }

  List<Widget> widgetGenerator() {
    var tabWidgets = List.generate(planName.length, (index) {
      return const ListHome(
        keyForApiCall: '',
      );
    });
    return tabWidgets;
  }
}
