import 'package:flutter/material.dart';
import 'package:moniepoint_test/core/assets.dart';
import 'package:moniepoint_test/core/dimensions.dart';
import 'package:moniepoint_test/core/responsive_extension.dart';
import 'package:moniepoint_test/core/theme.dart';
import 'package:moniepoint_test/core/theme_extension.dart';

class SearchListWidget extends StatelessWidget {
  const SearchListWidget({
    super.key,
  });

  ///copilot
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: Dims.appSideGap, bottom: 1),
      margin: const EdgeInsets.symmetric(horizontal: Dims.appSideGap),
      decoration: BoxDecoration(
          color: appColor.white,
          boxShadow: [
            BoxShadow(
              color: appColor.gray.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(
                  0, 1), // changes the position of the shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dims.appSideGap),
        child: SizedBox(
          height: context.screenSize.height * 0.5,
          child: ListView.separated(
            itemCount: 6,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 22, child: Divider());
            },
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundImage: const AssetImage(item),
                    backgroundColor: appColor.transparent,
                  ),
                  const SizedBox(
                    width: Dims.averterSideGap,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Macbook Pro M2',
                        style: context.theme.textTheme.titleMedium,
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '#NEJ20089934122231',
                              children: [
                                WidgetSpan(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4, right: 4, bottom: 5),
                                    child: Icon(Icons.circle,
                                        size: 8, color: appColor.gray),
                                  ),
                                ),
                                const TextSpan(
                                  text: 'Paris',
                                ),
                                WidgetSpan(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 2),
                                    child: Icon(Icons.arrow_forward,
                                        size: 14, color: appColor.gray),
                                  ),
                                ),
                                const TextSpan(
                                  text: 'Morocco',
                                ),
                              ],
                            ),
                          ],
                        ),
                        style: context.theme.textTheme.titleSmall?.copyWith(
                            color: appColor.gray, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
