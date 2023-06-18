import 'package:flutter/material.dart';

///  {"label": 'Home', "icon": homeIcon, "page": HomePage(),"appBar": AppBar(title: Text('Home'),)}},
class HomePageData {
  final String label;
  final Widget icon;
  final Widget? page;
  final  Widget? appBar;

  const HomePageData({
    required this.label,
    required this.icon,
    this.page,
    this.appBar,
  });
}
