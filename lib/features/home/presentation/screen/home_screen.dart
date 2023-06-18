import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:moniepoint_test/core/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moniepoint_test/core/assets.dart';
import 'package:moniepoint_test/core/data/model/home_page_data.dart';
import 'package:moniepoint_test/core/dimensions.dart';
import 'package:moniepoint_test/core/navigator_manager.dart';
import 'package:moniepoint_test/core/theme.dart';
import 'package:moniepoint_test/core/theme_extension.dart';
import 'package:moniepoint_test/features/home/presentation/vm/home_vm.dart';
import 'package:moniepoint_test/features/calculate/presentation/widget/calculate_appbar.dart';
import 'package:moniepoint_test/features/dashboard/presentation/widget/dashboard_appbar.dart';
import 'package:moniepoint_test/features/home/presentation/widget/seach_list.dart';
import 'package:moniepoint_test/features/profile/presentation/widget/profile_appbar.dart';
import 'package:moniepoint_test/features/calculate/presentation/screen/calculate_page.dart';
import 'package:moniepoint_test/features/dashboard/presentation/screen/dashboard_page.dart';
import 'package:moniepoint_test/features/home/presentation/widget/page_wrapper.dart';
import 'package:moniepoint_test/features/profile/presentation/screen/profile_page.dart';
import 'package:moniepoint_test/features/shipment/presentation/screen/shipment_page.dart';
import 'package:moniepoint_test/features/shipment/presentation/widget/shipment_appbar.dart';
import 'package:provider/provider.dart';

const appBarTopPadding = 14.0;
const horizontalGap = 20.0;
const verticalGap = 16.0;
const iconSize = 28.0;

const pages = [
  HomePageData(
    label: 'Home',
    icon: Icon(Icons.home_outlined),
    page: DashboardPage(),
    appBar: DashboardAppBar(),
  ),
  HomePageData(
    label: 'Calculate',
    icon: Icon(Icons.calculate_outlined),
  ),
  HomePageData(
    label: 'Shipment',
    icon: Icon(Icons.av_timer_outlined),
  ),
  HomePageData(
      label: 'Profile',
      icon: Icon(Icons.person_outline_outlined),
      page: ProfilePage(),
      appBar: ProfileAppBar()),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: appColor.primary),
    );
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: appColor.primary),
      child: const Scaffold(
        bottomNavigationBar: PageWrapper(
          child: _BottomNavigationWidget(),
        ),
        body: SafeArea(child: PageBody()),
      ),
    );
  }
}

class PageBody extends StatelessWidget {
  const PageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var viewModel = context.watch<HomePageViewModel>();
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: pages[viewModel.selectedTab].appBar,
          ),
          const SizedBox(
            height: verticalGap,
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 600),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            switchOutCurve: Curves.easeInOut,
            reverseDuration: const Duration(milliseconds: 200),
            child: viewModel.searchFocusNode.hasFocus
                ? const PageWrapper(child: SearchListWidget())
                : pages.map((e) => e.page).toList()[viewModel.selectedTab],
          ),
          // IndexedStack(
          //   index: viewModel.selectedTab,
          //   children: pages
          //       .map((e) => Container(
          //         padding: const EdgeInsets.symmetric(
          //             // horizontal: Dims.appSideGap,
          //             vertical: Dims.appVertGap),
          //         child: e.page,
          //       ))
          //       .toList(),
          // ),
          // Main Page
        ],
      ),
    );
  }
}

class _BottomNavigationWidget extends StatelessWidget {
  const _BottomNavigationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var bottomIconSize = 26.0;
    final vm = context.watch<HomePageViewModel>();
    final readVm = context.read<HomePageViewModel>();
    return SizedBox(
      height: 80,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 4,
            child: Row(
              children: pages
                  .asMap()
                  .entries
                  .map((e) => Expanded(
                        child: Container(
                          color: readVm.selectedTab == e.key
                              ? appColor.primary
                              : null,
                        ),
                      ))
                  .toList(),
            ),
          ),
          Expanded(
            child: BottomNavigationBar(
              currentIndex: vm.selectedTab,
              onTap: (index) {
                if (index == 1) {
                  Navigator.pushNamed(context, NavigatorManager.calculate);
                } else if (index == 2) {
                  Navigator.pushNamed(context, NavigatorManager.shipment);
                } else {
                  readVm.selectedTab = index;
                }
              },
              type: BottomNavigationBarType.fixed,
              selectedItemColor: appColor.primary,
              unselectedItemColor: appColor.lightGray,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedFontSize: 16,
              unselectedFontSize: 14,
              iconSize: iconSize,
              items: pages
                  .asMap()
                  .entries
                  .map((e) => BottomNavigationBarItem(
                        icon: e.value.icon,
                        label: e.value.label,
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class TmpPage extends StatelessWidget {
  const TmpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(NavigatorManager.details);
                },
                child: Text(
                  "go",
                  style: appTheme.light.textTheme.titleMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(16);
    return Stack(
      children: [
        Positioned.fill(
          child: SizedBox(
            width: 160,
            child: Material(
              elevation: 1,
              borderRadius:
                  const BorderRadius.vertical(bottom: radius, top: radius),
              child: Flex(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                direction: Axis.vertical,
                children: [
                  SizedBox(
                      width: double.infinity,
                      height: 127,
                      child: ClipRRect(
                          borderRadius:
                              const BorderRadius.vertical(top: radius),
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/41/109817/1.jpg?8356',
                            width: 90,
                            height: 120,
                            fit: BoxFit.cover,
                          ))),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 13,
                        ),
                        SizedBox(
                            height: 18,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: Text("Category",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(
                                          color: appColor.gray,
                                          letterSpacing: 0.5,
                                          fontWeight: FontWeight.w500)),
                            )),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 0, top: 8, right: 6),
                          child: Text("Title is here and here and here",
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                      color: appColor.blackMedium,
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.w700,
                                      height: 1.2)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0, top: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: FittedBox(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 0),
                                  child: Text.rich(
                                    const TextSpan(text: '', children: [
                                      WidgetSpan(
                                          child: Icon(
                                        Icons.star,
                                        size: 20,
                                        color: Colors.orangeAccent,
                                      )),
                                      TextSpan(text: ' 4.9|2354'),
                                    ]),
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(color: appColor.gray),
                                  ),
                                ),
                              )),
                              // Spacer(
                              // ),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(left: 2),
                                child: Text(
                                  '\$12.00',
                                  textAlign: TextAlign.right,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          color: appColor.primary,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                ),
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.favorite, color: Colors.red),
            )),
      ],
    );
  }
}

class SliderProgress extends StatelessWidget {
  const SliderProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 16,
            height: 5,
            // color: appColor.black,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18), color: appColor.black),
          ),
          const SizedBox(
            width: 4,
          ),
          Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(108), color: appColor.gray),
          ),
          const SizedBox(
            width: 4,
          ),
          Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(108), color: appColor.gray),
          )
        ],
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: horizontalGap - 10, vertical: 42),
      child: Column(
        children: [
          const SizedBox(height: appBarTopPadding),
          Row(
            children: [
              Expanded(
                  flex: 10,
                  child: SizedBox(
                    height: kToolbarHeight - 6,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIconConstraints:
                            const BoxConstraints(minWidth: 24, minHeight: 24),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: SvgPicture.asset(
                            searchIcon,
                            width: 24,
                            height: 24,
                            fit: BoxFit.contain,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  )),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    cart,
                    height: 30,
                    width: 30,
                  )),
              const SizedBox(width: 8),
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    chat,
                    height: 30,
                    width: 30,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

class PairValue {
  String value1;
  String value2;

  PairValue(this.value1, this.value2);
}
