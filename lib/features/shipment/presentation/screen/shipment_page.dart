import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:moniepoint_test/core/assets.dart';
import 'package:moniepoint_test/core/dimensions.dart';
import 'package:moniepoint_test/core/responsive_extension.dart';
import 'package:moniepoint_test/core/snap_scroll_physics.dart';
import 'package:moniepoint_test/core/theme.dart';
import 'package:moniepoint_test/core/theme_extension.dart';
import 'package:moniepoint_test/features/home/presentation/widget/page_wrapper.dart';
import 'package:moniepoint_test/features/shipment/presentation/vm/shipment_vm.dart';
import 'package:moniepoint_test/features/shipment/presentation/widget/shipment_appbar.dart';
import 'package:provider/provider.dart';
import 'package:snap_scroll_physics/snap_scroll_physics.dart';

class ShipmentPage extends HookWidget {
  const ShipmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var itemCount = 13;
    var vm = context.watch<ShipmentVm>();
    var controller = useAnimationController(duration: Duration(seconds: 1));
    useEffect(() {
      controller.forward();
      return () {};
    });
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ShipmentAppBar(),
            const SizedBox(
              height: Dims.appVertGap,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dims.appSideGap),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: context.screenSize.height,
                    child: ListView.separated(
                      itemCount: vm.shipments.length,

                      physics: BouncingScrollPhysics(),
                      // physics:  BouncingScrollPhysics(itemHeight: 200),
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 22);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        var shipment = vm.shipments[index];
                        if (index == 0) {
                          return Text(
                            "Shipments",
                            style: context.theme.textTheme.headlineMedium,
                          );
                        }
                        if (index == itemCount - 1) {
                          return const SizedBox(height: 252);
                        }
                        return SizedBox(
                          height: 170,
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: Offset(0, 1),
                              end: Offset.zero,
                            ).animate(CurvedAnimation(
                              parent: controller..forward(),
                              curve: Curves.easeInOut,
                            )),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: appColor.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: appColor.gray.withOpacity(0.3),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: const Offset(0,
                                          1), // changes the position of the shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: Dims.appSideGap,
                                  vertical: Dims.appVertGap),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 4,),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextButton.icon(
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                            backgroundColor:
                                                appColor.gray.withOpacity(0.2),
                                            textStyle: context
                                                .theme.textTheme.titleSmall
                                                ?.copyWith(
                                                    color: appColor.success),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 2),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            )),
                                        icon: Icon(Icons.change_circle_outlined,
                                            color: appColor.success),
                                        label: Text(shipment.status,
                                            style: context
                                                .theme.textTheme.titleSmall
                                                ?.copyWith(
                                                    color: appColor.success)),
                                      ),
                                      Text(
                                        shipment.message,
                                        style:
                                            context.theme.textTheme.titleLarge,
                                      ),
                                      Text(
                                        'Your delivery, #NEJ20089934122231\nfrom Atlanta, is arriving today!',
                                        maxLines: 3,
                                        softWrap: true,
                                        style: context
                                            .theme.textTheme.titleSmall
                                            ?.copyWith(color: appColor.gray),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: '\$1400USD',
                                                children: [
                                                  WidgetSpan(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 4,
                                                              right: 4,
                                                              bottom: 5,
                                                              top: 2),
                                                      child: Icon(Icons.circle,
                                                          size: 6,
                                                          color: appColor.gray
                                                              .withOpacity(
                                                                  0.8)),
                                                    ),
                                                  ),
                                                  TextSpan(
                                                      text: 'Sep 20 2023',
                                                      style: context.theme
                                                          .textTheme.titleSmall
                                                          ?.copyWith(
                                                              color: appColor
                                                                  .black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400)),
                                                ],
                                              ),
                                            ],
                                          ),
                                          style: context
                                              .theme.textTheme.titleSmall
                                              ?.copyWith(
                                                  color: appColor.primary,
                                                  fontWeight: FontWeight.w600))
                                    ],
                                  ),
                                  CircleAvatar(
                                    radius: 32,
                                    backgroundImage: const AssetImage(shipItem),
                                    backgroundColor: appColor.transparent,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
