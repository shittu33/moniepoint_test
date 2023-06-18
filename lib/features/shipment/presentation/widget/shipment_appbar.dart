import 'package:flutter/material.dart';
import 'package:moniepoint_test/core/theme.dart';
import 'package:moniepoint_test/core/theme_extension.dart';
import 'package:moniepoint_test/features/home/presentation/widget/app_bar_wrapper.dart';
import 'package:moniepoint_test/features/shipment/presentation/vm/shipment_vm.dart';
import 'package:provider/provider.dart';
import 'package:snap_scroll_physics/snap_scroll_physics.dart';

class ShipmentAppBar extends StatelessWidget {
  const ShipmentAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tabSize = 50.0;
    final vm = context.read<ShipmentVm>();
    return AppBarWrapper(
        child: DefaultTabController(
      length: tabList.length,
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
            title: Text("Shipment history",
                style: context.theme.textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                )),
          ),
          TabBar(
            physics: SnapScrollPhysics.cupertinoAppBar,
            // physics: BouncingScrollPhysics(),
            labelColor: Colors.white,
            indicatorWeight: 1,
            indicatorPadding: EdgeInsets.only(top: tabSize - 3),
            indicatorSize: TabBarIndicatorSize.tab,
            unselectedLabelColor: appColor.lightGray,
            // indicatorColor: Colors.black,
            isScrollable: true,
            onTap: (index) {
              context.read<ShipmentVm>().selectedTab = index;
            },
            tabs: tabList.asMap().entries.map((e) {
              var watchVm = context.watch<ShipmentVm>();
              return SizedBox(
                height: tabSize,
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Text(e.value.category),
                  Container(
                      margin: EdgeInsets.only(left: 6),
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: watchVm.selectedTab == e.key
                            ? appColor.accent
                            : appColor.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Text(shipmentList
                          .where((element) {
                            if(e.value.category.toLowerCase() =="all"){
                              return true;
                            }
                            return element.status ==
                              e.value.category;
                          })
                          .length
                          .toString())),
                  // Badge(
                  //   alignment: AlignmentDirectional.centerEnd,
                  //   padding: EdgeInsets.all(8),
                  //   child: Text("3"),
                  //   smallSize: 30,
                  // )
                ]),
              );
            }).toList(),
          ),
        ],
      ),
    ));
  }
}
