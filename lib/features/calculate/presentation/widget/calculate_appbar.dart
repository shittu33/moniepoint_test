import 'package:flutter/material.dart';
import 'package:moniepoint_test/core/dimensions.dart';
import 'package:moniepoint_test/core/theme.dart';
import 'package:moniepoint_test/core/theme_extension.dart';
import 'package:moniepoint_test/features/home/presentation/widget/app_bar_wrapper.dart';
import 'package:moniepoint_test/features/dashboard/presentation/screen/dashboard_page.dart';

class CalculatorAppBar extends StatelessWidget {
  const CalculatorAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBarWrapper(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: Dims.appVertGap,horizontal: Dims.appSideGap),
          child: Column(
      children: [
          AppBar(
            backgroundColor: appColor.transparent,
            elevation: 0,
            leading: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.arrow_back_ios)),
            centerTitle: true,
            title: Text("Calculate",
                style: context.theme.textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                )),
          ),
          Container(),
      ],
    ),
        ));
  }
}
