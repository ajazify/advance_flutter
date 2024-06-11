/* controller seperates the business logic, if you don't want a controller you can simply add the 
below methods to the view page directly,but,I recommend to use controller as best practice. 
*/

import 'package:dynamic_tabview/list_home.dart';
import 'package:flutter/material.dart';

class HomeController {
  //! This List of Objects can be hardcoded like this or can be
  List<dynamic> planAsListOfDict = [
    {"planName": "Bronze", "id": "001"},
    {"planName": "Silver", "id": "002"},
    {"planName": "Platinum", "id": "003"},
    {"planName": "Gold", "id": "004"},
  ];

  //^ List for id and widget
  List<String> id = [];
  List<Widget> tabWidgets = [];

  //! Method to;
  //! Get 'id' from 'planAsListOfDict' and add to 'List<String> id'
  //! Get 'planName' from 'planAsListOfDict' and add to 'List<String> id'
  List<Widget> fetchTitleWidget() {
    tabWidgets.clear();
    id.clear();
    for (var entryDict in planAsListOfDict) {
      id.add(entryDict['id']);
      tabWidgets.add(Text(entryDict['planName']));
    }
    return tabWidgets;
  }

  //! Method to;
  //! Generate TabView based on the TabTitle (which is equal to length of Tabview) 
  //! Generate TabView widgets
  //! and the 'id 'which we saved as a list is passed to that widget by index   
  List<Widget> widgetGenerator() {
    var tabWidgets = List.generate(planAsListOfDict.length, (index) {
      return ListHome(
        keyForApiCall: id[index],
      );
    });
    return tabWidgets;
  }
}
