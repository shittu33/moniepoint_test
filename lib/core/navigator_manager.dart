import 'package:flutter/cupertino.dart';
import 'package:moniepoint_test/features/calculate/presentation/screen/calculate_page.dart';
import 'package:moniepoint_test/features/home/presentation/vm/home_vm.dart';
import 'package:moniepoint_test/features/home/presentation/screen/home_screen.dart';
import 'package:moniepoint_test/features/shipment/presentation/screen/shipment_page.dart';
import 'package:moniepoint_test/features/shipment/presentation/vm/shipment_vm.dart';
import 'package:provider/provider.dart';

import '../features/home/presentation/screen/home_screen_old.dart';

class NavigatorManager {
  static const String initial = "/";
  static const String calculate = "calculate";
  static const String shipment = "shipment";
  static const String details = "details";

  static Map<String, Widget Function(BuildContext context)> routes = {
    initial: (context) => ChangeNotifierProvider(
        create: (BuildContext context) => HomePageViewModel(),
        child: const HomeScreen()),
    calculate: (context) => const CalculatorPage(),
    shipment: (context) => ChangeNotifierProvider(
        create: (BuildContext context) => ShipmentVm(),
        child: const ShipmentPage()),
    details: (context) => const TmpPage(),
  };

  static Future navigateTo(
    BuildContext context,
    name, {
    bool replace = false,
  }) {
    if (replace) {
      return Navigator.of(context).popAndPushNamed(name);
    } else {
      return Navigator.of(context).pushNamed(name);
    }
  }
}
