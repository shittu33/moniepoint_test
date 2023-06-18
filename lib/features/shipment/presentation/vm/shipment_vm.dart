import 'package:flutter/material.dart';

class ShipmentVm extends ChangeNotifier {
  int _selectedTab = 0;

  int get selectedTab => _selectedTab;

  set selectedTab(int value) {
    _selectedTab = value;
    _shipments = shipmentList.where((element) {
      if (tabList[value].category.toLowerCase() == "all") {
        return true;
      }
      return element.status == tabList[value].category;
    }).toList();
    notifyListeners();
  }

  var _shipments = shipmentList;

  List<ShipmentData> get shipments => _shipments;
}

 final shipmentList=  [
      ShipmentData("Arrived", ""),
      ShipmentData("Arrived", "Completed"),
      ShipmentData("Arriving tommorow!", "Completed"),
      ...List.generate(
        10,
        (index) => ShipmentData(
          (messageList..shuffle()).first,
          (statusList..shuffle()).first,
        ),
      ),
    ];

var statusList = [
  "Completed",
  "In progress",
  "Pending order",
  "Loading",
  "Cancelled"
];
var messageList = [
  "Arrived",
  "Arriving tommorow!",
  "Arriving today!",
  "Waiting for pickup",
];
const tabList = [
  TabData("All", 13),
  TabData("Completed", 5),
  TabData("In progress", 6),
  TabData("Pending order", 10),
  TabData("Loading", 10),
  TabData("Cancelled", 4),
];

class ShipmentData {
  String message;
  String status;

  ShipmentData(this.message, this.status);
}

class TabData {
  final String category;
  final int count;

  const TabData(this.category, this.count);
}
