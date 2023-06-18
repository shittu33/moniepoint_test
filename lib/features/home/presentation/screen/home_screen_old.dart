// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:moniepoint_test/core/constants.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:moniepoint_test/core/aseets.dart';
// import 'package:moniepoint_test/core/navigator_manager.dart';
// import 'package:moniepoint_test/core/theme.dart';
// import 'package:moniepoint_test/core/theme_extension.dart';
//
//
// const appBarTopPadding = 14.0;
// const horizontalGap = 20.0;
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   int selectedTab = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     var bottomIconSize = 26.0;
//     return Scaffold(
//       // appBar: AppBar(),
//
//       body: CustomScrollView(
//         // anchor: 1.0,
//         // dragStartBehavior: DragStartBehavior.start,
//         slivers: [
//           SliverAppBar(
//             backgroundColor: appColor.white,
//             flexibleSpace: const _HeadSection(),
//             title: const AppBar(),
//             expandedHeight: 390,
//             toolbarHeight: kToolbarHeight + appBarTopPadding,
//             collapsedHeight: kToolbarHeight + 30,
//             // floating: true,
//             // snap: true,
//             pinned: true,
//           ),
//           const SliverToBoxAdapter(
//             child: SizedBox(
//               height: 20,
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: horizontalGap),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("Best Sale Product",
//                       style: context.theme.textTheme.displaySmall?.copyWith(
//                           color: appColor.blackMedium, fontSize: 20)),
//                   TextButton(
//                     onPressed: () {},
//                     child: Text(
//                       "See more",
//                       style: context.theme.textTheme.labelSmall!.copyWith(
//                           color: appColor.primary,
//                           fontSize: 14,
//                           fontWeight: FontWeight.w600,
//                           letterSpacing: 0.5),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           const SliverToBoxAdapter(
//             child: SizedBox(
//               height: 20,
//             ),
//           ),
//           SliverPadding(
//             padding: const EdgeInsets.symmetric(horizontal: horizontalGap),
//             sliver: SliverGrid.builder(
//                 gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                   maxCrossAxisExtent: 200.0,
//                   mainAxisSpacing: 24,
//                   crossAxisSpacing: 16,
//                   childAspectRatio: 0.7,
//                 ),
//                 itemCount: 20,
//                 itemBuilder: (ctx, index) {
//                   return GestureDetector(
//                       onTap: () {
//                         Navigator.pushNamed(context, NavigatorManager.details);
//                       }, child: const ProductWidget());
//                   // return ;
//                 }),
//           ),
//           const SliverToBoxAdapter(
//             child: SizedBox(
//               height: 200,
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: selectedTab,
//         onTap: (index) {
//           setState(() {
//             selectedTab = index;
//           });
//         },
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: Colors.grey,
//         showSelectedLabels: true,
//         showUnselectedLabels: true,
//         items: [
//           {"label": 'Home', "icon": homeIcon},
//           {"label": 'Voucher', "icon": voucherIcon},
//           {"label": 'Wallet', "icon": walletIcon},
//           {"label": 'Settings', "icon": settingsIcon},
//         ]
//             .asMap()
//             .entries
//             .map((e) => BottomNavigationBarItem(
//                   icon: SvgPicture.asset(
//                     e.value['icon'] ?? '',
//                     width: bottomIconSize,
//                     height: bottomIconSize,
//                     // color: selectedTab==e.key?Colors.blue:appColor.darkGray,
//                   ),
//                   label: e.value['label'],
//                 ))
//             .toList(),
//       ),
//     );
//   }
// }
//
// class ProductWidget extends StatelessWidget {
//   const ProductWidget({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     const radius = Radius.circular(16);
//     return Stack(
//       children: [
//         Positioned.fill(
//           child: SizedBox(
//             width: 160,
//             child: Material(
//               elevation: 1,
//               borderRadius:
//                   const BorderRadius.vertical(bottom: radius, top: radius),
//               child: Flex(
//                 mainAxisSize: MainAxisSize.max,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 direction: Axis.vertical,
//                 children: [
//                   SizedBox(
//                       width: double.infinity,
//                       height: 127,
//                       child: ClipRRect(
//                           borderRadius:
//                               const BorderRadius.vertical(top: radius),
//                           child: CachedNetworkImage(
//                             imageUrl:
//                                 'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/41/109817/1.jpg?8356',
//                             width: 90,
//                             height: 120,
//                             fit: BoxFit.cover,
//                           ))),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 10.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const SizedBox(
//                           height: 13,
//                         ),
//                         SizedBox(
//                             height: 18,
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 0),
//                               child: Text("Category",
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .labelSmall
//                                       ?.copyWith(
//                                           color: appColor.gray,
//                                           letterSpacing: 0.5,
//                                           fontWeight: FontWeight.w500)),
//                             )),
//                         Padding(
//                           padding:
//                               const EdgeInsets.only(left: 0, top: 8, right: 6),
//                           child: Text("Title is here and here and here",
//                               softWrap: true,
//                               maxLines: 2,
//                               overflow: TextOverflow.ellipsis,
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .labelMedium
//                                   ?.copyWith(
//                                       color: appColor.blackMedium,
//                                       letterSpacing: 0.5,
//                                       fontWeight: FontWeight.w700,
//                                       height: 1.2)),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(right: 8.0, top: 8),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(
//                                   child: FittedBox(
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(left: 0),
//                                   child: Text.rich(
//                                     const TextSpan(text: '', children: [
//                                       WidgetSpan(
//                                           child: Icon(
//                                         Icons.star,
//                                         size: 20,
//                                         color: Colors.orangeAccent,
//                                       )),
//                                       TextSpan(text: ' 4.9|2354'),
//                                     ]),
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .labelLarge
//                                         ?.copyWith(color: appColor.gray),
//                                   ),
//                                 ),
//                               )),
//                               // Spacer(
//                               // ),
//                               Expanded(
//                                   child: Padding(
//                                 padding: const EdgeInsets.only(left: 2),
//                                 child: Text(
//                                   '\$12.00',
//                                   textAlign: TextAlign.right,
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .bodyLarge
//                                       ?.copyWith(
//                                           color: appColor.primary,
//                                           fontWeight: FontWeight.w500,
//                                           fontSize: 16),
//                                 ),
//                               )),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         const Align(
//             alignment: Alignment.topRight,
//             child: Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Icon(Icons.favorite, color: Colors.red),
//             )),
//       ],
//     );
//   }
// }
//
// class SliderProgress extends StatelessWidget {
//   const SliderProgress({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             width: 16,
//             height: 5,
//             // color: appColor.black,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(18), color: appColor.black),
//           ),
//           const SizedBox(
//             width: 4,
//           ),
//           Container(
//             width: 5,
//             height: 5,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(108), color: appColor.gray),
//           ),
//           const SizedBox(
//             width: 4,
//           ),
//           Container(
//             width: 5,
//             height: 5,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(108), color: appColor.gray),
//           )
//         ],
//       ),
//     );
//   }
// }
//
// class MainMenu extends StatelessWidget {
//   const MainMenu({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: appColor.white,
//       child: Padding(
//         padding:
//             const EdgeInsets.symmetric(horizontal: horizontalGap, vertical: 14),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 PairValue('Category', category),
//                 PairValue('Flight', flight),
//                 PairValue('Bill', bill),
//                 PairValue('Data Plan', topup),
//                 PairValue('Top Up', topup),
//               ]
//                   .map((e) => Column(
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                               color: appColor.lightGray.withOpacity(0.3),
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             padding: const EdgeInsets.all(8),
//                             child: SvgPicture.asset(
//                               e.value2,
//                               width: 24,
//                               height: 24,
//                             ),
//                           ),
//                           const SizedBox(height: 12),
//                           Text(
//                             e.value1,
//                             style: context.theme.textTheme.labelSmall?.copyWith(
//                                 color: appColor.darkGray,
//                                 fontWeight: FontWeight.w600),
//                           ),
//                         ],
//                       ))
//                   .toList(),
//             ),
//             const SizedBox(height: 18),
//             const SliderProgress(),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class _HeadSection extends StatelessWidget {
//   const _HeadSection({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return FlexibleSpaceBar(
//       collapseMode: CollapseMode.parallax,
//       // background: ProductSlideShow(),
//       background: Column(
//         children: const [
//           ProductSlideShow(),
//           MainMenu(),
//         ],
//       ),
//     );
//   }
// }
//
// class AppBar extends StatelessWidget {
//   const AppBar({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(
//           horizontal: horizontalGap - 10, vertical: 42),
//       child: Column(
//         children: [
//           const SizedBox(height: appBarTopPadding),
//           Row(
//             children: [
//               Expanded(
//                   flex: 10,
//                   child: SizedBox(
//                     height: kToolbarHeight - 6,
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         hintText: 'Search',
//                         prefixIconConstraints:
//                             const BoxConstraints(minWidth: 24, minHeight: 24),
//                         prefixIcon: Padding(
//                           padding: const EdgeInsets.only(left: 8.0),
//                           child: SvgPicture.asset(
//                             searchIcon,
//                             width: 24,
//                             height: 24,
//                             fit: BoxFit.contain,
//                           ),
//                         ),
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8)),
//                       ),
//                     ),
//                   )),
//               const SizedBox(
//                 width: 10,
//               ),
//               IconButton(
//                   onPressed: () {},
//                   icon: SvgPicture.asset(
//                     cart,
//                     height: 30,
//                     width: 30,
//                   )),
//               const SizedBox(width: 8),
//               IconButton(
//                   onPressed: () {},
//                   icon: SvgPicture.asset(
//                     chat,
//                     height: 30,
//                     width: 30,
//                   )),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class PairValue {
//   String value1;
//   String value2;
//
//   PairValue(this.value1, this.value2);
// }
