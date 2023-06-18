import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moniepoint_test/core/assets.dart';
import 'package:moniepoint_test/core/theme.dart';
import 'package:moniepoint_test/core/theme_extension.dart';
import 'package:moniepoint_test/features/home/presentation/widget/page_wrapper.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            CircleAvatar(
              radius: 52,
              backgroundImage: const AssetImage(user1),
              backgroundColor: appColor.transparent,
            ),
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
            Text(
              'Profile Page',
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
