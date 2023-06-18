import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moniepoint_test/core/assets.dart';
import 'package:moniepoint_test/core/dimensions.dart';
import 'package:moniepoint_test/core/theme.dart';
import 'package:moniepoint_test/core/theme_extension.dart';
import 'package:moniepoint_test/features/home/presentation/vm/home_vm.dart';
import 'package:moniepoint_test/features/home/presentation/widget/app_bar_wrapper.dart';
import 'package:provider/provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DashboardAppBar extends StatelessWidget {
  const DashboardAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var watchSearchFocusNode =
        context.watch<HomePageViewModel>().searchFocusNode;
    return AppBarWrapper(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: Dims.appVertGap,horizontal: Dims.appSideGap),
        child: Column(
          children: [
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
              child: watchSearchFocusNode.hasFocus
                  ? const Padding(
                      padding: EdgeInsets.only(top: Dims.appVertGap * 2),
                      child: SearchPanel(),
                    )
                  : Column(
                      children: const [
                        AccountSection(),
                        SizedBox(height: Dims.appVertGap * 2),
                        SearchPanel(),
                      ],
                    ),
            ),
            const SizedBox(height: Dims.appVertGap),
          ],
        ),
      ),
    );
  }
}

class SearchPanel extends StatelessWidget {
  const SearchPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var watchSearchFocusNode =
        context.watch<HomePageViewModel>().searchFocusNode;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (watchSearchFocusNode.hasFocus)
          AnimationConfiguration.staggeredList(
            position: 0,
            // curve: Curves.easeInOut,
            // transformAlignment: Alignment.topLeft,
            child: SlideAnimation(
              horizontalOffset: -100,
              duration: const Duration(milliseconds: 600),
              child: GestureDetector(
                  onTap: () {
                    context.read<HomePageViewModel>().searchFocusNode.unfocus();
                  },
                  child: Icon(Icons.chevron_left,
                      size: 30, color: appColor.white)),
            ),
          ),
        const SizedBox(width: Dims.averterSideGap),
        const Expanded(
          child: SearchBar(),
        ),
      ],
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var searchRadius = 48.0;
    var searchFocusNode = context.read<HomePageViewModel>().searchFocusNode;
    return WillPopScope(
      onWillPop: () {
        if (searchFocusNode.hasFocus) {
          searchFocusNode.unfocus();
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: SizedBox(
        // height: kToolbarHeight - 6,
        child: TextFormField(
          focusNode: searchFocusNode,
          onEditingComplete: () {
            searchFocusNode.unfocus();
          },
          // onTapOutside: (_) {
          //   searchFocusNode.unfocus();
          // },
          style: TextStyle(
            color: appColor.blackMedium.withOpacity(0.6),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: 'Enter the receipt number...',
            // constraints: const BoxConstraints(maxHeight: 43),
            prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 2),
                child: Icon(
                  Icons.search_rounded,
                  size: 23,
                  color: appColor.black,
                )),
            suffixIcon: Container(
              decoration: BoxDecoration(
                color: appColor.accent,
                shape: BoxShape.circle,
              ),
              margin: const EdgeInsets.only(right: 3, top: 2, bottom: 2),
              child: Image.asset(
                searchSuffix,
                scale: 1.6,
              ),
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(searchRadius)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(searchRadius)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(searchRadius)),
          ),
        ),
      ),
    );
  }
}

class AccountSection extends StatelessWidget {
  const AccountSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("onTap");
        context.read<HomePageViewModel>().selectedTab = 3;
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 22,
            backgroundImage: const AssetImage(user),
            backgroundColor: appColor.transparent,
          ),
          const SizedBox(
            width: Dims.averterSideGap,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(children: [
                  WidgetSpan(
                    child: SvgPicture.asset(
                      locationBendIcon,
                      height: 22,
                      color: appColor.lightGray,
                    ),
                  ),
                  TextSpan(
                      text: "Your location",
                      style: context.theme.textTheme.titleSmall
                          ?.copyWith(color: appColor.lightGray)),
                ]),
                style: TextStyle(color: appColor.white),
              ),
              Text.rich(
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print("onTap");
                        context.read<HomePageViewModel>().selectedTab = 3;
                      },
                    children: [
                      TextSpan(
                          text: " AbdulMujeeb,Shittu",
                          style: context.theme.textTheme.titleMedium
                              ?.copyWith(color: appColor.white)),
                      WidgetSpan(
                        child: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: appColor.white,
                        ),
                      ),
                    ]),
                style: TextStyle(color: appColor.white),
              ),
            ],
          ),
          const Spacer(),
          CircleAvatar(
            radius: 20,
            backgroundColor: appColor.white,
            child: SvgPicture.asset(
              ringBellIcon,
              width: 30,
              height: 30,
              color: appColor.black,
            ),
          )
        ],
      ),
    );
  }
}
