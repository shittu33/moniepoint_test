import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moniepoint_test/core/assets.dart';
import 'package:moniepoint_test/core/theme.dart';
import 'package:moniepoint_test/core/theme_extension.dart';

import 'widget/slide_show.dart';

const appBarTopPadding = 14.0;
const horizontalGap = 20.0;

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    // var arguments2 = ModalRoute.of(context)?.settings.arguments as S;
    var bottomIconSize = 26.0;
    return Scaffold(
      // appBar: AppBar(),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  width: double.infinity,
                  height: 300,
                  imageUrl:
                      'https://ng.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/41/109817/1.jpg?8356',
                ),
                Align(child: Column(children: [

                ],),)
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(),
    );
  }
}
