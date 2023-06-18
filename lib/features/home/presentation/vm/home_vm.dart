import 'package:flutter/material.dart';
import 'package:moniepoint_test/core/assets.dart';
import 'package:provider/provider.dart';

class HomePageViewModel extends ChangeNotifier {
  int _selectedTab = 0;

  int get selectedTab => _selectedTab;

  set selectedTab(int value) {
    _selectedTab = value;
    notifyListeners();
  }

  final FocusNode _searchFocusNode = FocusNode();

  FocusNode get searchFocusNode => _searchFocusNode;

  HomePageViewModel() {
    // TextEditingController _searchController = TextEditingController();
    // _searchController
    // _searchFocusNode.
    _searchFocusNode.addListener(() {
      // _searchFocusNode.hasFocus ? selectedTab = 1 : selectedTab = 0;
      notifyListeners();
      print('has focus: ${_searchFocusNode.hasPrimaryFocus}');
    });
  }

  final vehicles = const [
    Vehicle("Ocean fright", "International", shipCargo),
    Vehicle("Cargo fright", "Reliable", cargo),
    Vehicle("Air fright", "Faster", airCargo),
    Vehicle("Swift fright", "Faster", oceanCargo),
  ];
}

class Vehicle {
  final String title;
  final String subTitle;
  final String image;

  const Vehicle(this.title, this.subTitle, this.image);
}
