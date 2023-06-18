import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:moniepoint_test/core/assets.dart';
import 'package:moniepoint_test/core/dimensions.dart';
import 'package:moniepoint_test/core/theme.dart';
import 'package:moniepoint_test/core/theme_extension.dart';
import 'package:moniepoint_test/features/home/presentation/vm/home_vm.dart';
import 'package:moniepoint_test/features/home/presentation/widget/page_wrapper.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      child: Column(
        children: const [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dims.appSideGap),
            child: _TrackSection(),
          ),
          SizedBox(
            height: Dims.appVertGap * 3,
          ),
          _VehicleSection(),
        ],
      ),
    );
  }
}

class _VehicleSection extends StatelessWidget {
  const _VehicleSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Dims.appSideGap,
        ),
        child: Text(
          "Available vehicles",
          style: context.theme.textTheme.headlineSmall,
        ),
      ),
      const SizedBox(height: Dims.appVertGap),
      SizedBox(
        height: 230,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: context
              .read<HomePageViewModel>()
              .vehicles
              .map((e) => SizedBox(
                    width: 160,
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: Dims.appSideGap - 2, bottom: 12),
                      padding: const EdgeInsets.symmetric(
                          vertical: Dims.cardVertGap),
                      decoration: BoxDecoration(
                          color: appColor.white,
                          boxShadow: [
                            BoxShadow(
                              color: appColor.gray.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: const Offset(
                                  0, 1), // changes the position of the shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text(e.title,
                                style: context.theme.textTheme.titleMedium),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Text(e.subTitle,
                                style: context.theme.textTheme.titleSmall),
                          ),
                          Expanded(
                              child: AnimationConfiguration.staggeredList(
                                  position: 0,
                                  duration: const Duration(seconds: 1),
                                  child: SlideAnimation(
                                      horizontalOffset: 150,
                                      child: FadeInAnimation(
                                          child: Image.asset(e.image)))))
                        ],
                      ),
                    ),
                  ))
              .toList(),
        ),
      )
    ]);
  }
}

class _TrackSection extends StatelessWidget {
  const _TrackSection({
    super.key,
  });

  ///copilot
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Tracking",
          style: context.theme.textTheme.headlineSmall,
        ),
        const SizedBox(height: Dims.appVertGap),
        Container(
          padding: const EdgeInsets.only(top: Dims.cardVertGap, bottom: 1),
          decoration: BoxDecoration(
              color: appColor.white,
              boxShadow: [
                BoxShadow(
                  color: appColor.gray.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset:
                      const Offset(0, 1), // changes the position of the shadow
                ),
              ],
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: Dims.appSideGap),
                child: Column(
                  children: const [
                    _TrackHead(),
                    Divider(),
                    _TrackSender(),
                    SizedBox(
                      height: 20,
                    ),
                    _TrackReceiver(),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Divider(),
              SizedBox(
                height: 45,
                child: TextButton.icon(
                  onPressed: () {},
                  label: Text(
                    "Add Stop",
                    style: context.theme.textTheme.titleMedium
                        ?.copyWith(color: appColor.accent),
                  ),
                  icon: Icon(Icons.add),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _TrackReceiver extends StatelessWidget {
  const _TrackReceiver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              receiverBox,
              width: 40,
            ),
            const SizedBox(
              width: Dims.averterSideGap,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Receiver", style: context.theme.textTheme.titleSmall),
                Text(
                  "Chicago, 6342",
                  style: context.theme.textTheme.titleMedium,
                )
              ],
            ),
          ],
        ),
        SizedBox(
          width: 125,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Status", style: context.theme.textTheme.titleSmall),
              Text(
                "Waiting to collect",
                style: context.theme.textTheme.titleMedium,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _TrackSender extends StatelessWidget {
  const _TrackSender({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              senderBox,
              width: 40,
            ),
            const SizedBox(
              width: Dims.averterSideGap,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Sender", style: context.theme.textTheme.titleSmall),
                Text(
                  "Atlanta, 543",
                  style: context.theme.textTheme.titleMedium,
                )
              ],
            ),
          ],
        ),
        SizedBox(
          width: 125,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Time",
                  textAlign: TextAlign.start,
                  style: context.theme.textTheme.titleSmall),
              Text.rich(
                textAlign: TextAlign.start,
                TextSpan(children: [
                  WidgetSpan(
                      child: Padding(
                    padding:
                        const EdgeInsets.only(top: 7.0, bottom: 7, right: 3),
                    child: Icon(
                      Icons.circle,
                      color: appColor.success,
                      size: 8,
                    ),
                  )),
                  const TextSpan(
                    text: "2 day -3 days",
                  )
                ]),
                style: context.theme.textTheme.titleMedium,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _TrackHead extends StatelessWidget {
  const _TrackHead({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Shipment Number", style: context.theme.textTheme.titleSmall),
            const SizedBox(
              height: 2,
            ),
            Text(
              "NEJ20089934122231",
              style: context.theme.textTheme.titleLarge,
            )
          ],
        ),
        Image.asset(
          smallCargo,
          height: 60,
          width: 60,
        )
      ],
    );
  }
}
