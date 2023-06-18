import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:moniepoint_test/core/assets.dart';
import 'package:moniepoint_test/core/theme.dart';
import 'package:moniepoint_test/core/theme_extension.dart';

class ProductSlideShow extends StatefulWidget {
  const ProductSlideShow({Key? key}) : super(key: key);

  @override
  State<ProductSlideShow> createState() => _ProductSlideShowState();
}

class _ProductSlideShowState extends State<ProductSlideShow> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        SlideData(
            title: 'FASHIONDAY',
            details: '80% OFF',
            subDetails: 'Discover version that suit your style',
            image: slide1),
        SlideData(
            title: 'FASHIONDAY',
            details: '80% OFF',
            subDetails: 'Discover version that suit your style',
            image: slide2),
        SlideData(
            title: 'BEAUTYSALE',
            details: 'DISCOVER OUR BEAUTY SELECTION',
            image: slide3),
        // SlideData(
        //     title: 'BEAUTYSALE',
        //     details: 'DISCOVER OUR BEAUTY \nSELECTION',
        //     position: Alignment.center,
        //     image: slide4),
      ]
          .map((e) =>
          SlideItem(
            title: e.title,
            details: e.details,
            subDetails: e.subDetails,
            image: e.image,
            position: e.position,
          ))
          .toList(),
      options: CarouselOptions(
        height: 300,
        aspectRatio: 24 / 10,
        viewportFraction: 1,
        padEnds: false,
        disableCenter: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        enlargeCenterPage: true,
        onPageChanged: (index, reason) {
          // setState(() {
          //   _current = index;
          // });
        },
      ),
    );
  }
}

class SlideItem extends StatelessWidget {
  const SlideItem({Key? key,
    required this.title,
    required this.details,
    this.subDetails,
    required this.image,
    this.position})
      : super(key: key);
  final String title;
  final String details;
  final String? subDetails;
  final String image;
  final Alignment? position;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.only(
          left: position == Alignment.center ? 0 : 24, bottom: 20),
      child: position == Alignment.center
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // AssetsImage.svgRequestPaymentImage(),
          const SizedBox(height: 28),
          Text(
            "#$title",
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(
            details,
            textAlign: TextAlign.center,
            style: context.theme.textTheme.displayMedium?.copyWith(
                color: appColor.black,
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
          if (subDetails != null)
            Text(
              subDetails!,
              textAlign: TextAlign.center,
              style: context.theme.textTheme.bodyMedium
                  ?.copyWith(
                  color: appColor.darkGray, fontWeight: FontWeight.w700),
            ),
          OutlinedButton(
            onPressed: () {},
            child: Text(
              "Check this out",
              style: context.theme.textTheme.labelSmall
                  ?.copyWith(color: appColor.white),
            ),
            style: OutlinedButton.styleFrom(
              backgroundColor: appColor.black.withOpacity(0.7),
            ),
          ),
          SizedBox(height: 20,),
        ],
      )
          : SLideText(title: title, details: details, subDetails: subDetails),
    );
  }
}

class SLideText extends StatelessWidget {
  const SLideText({
    super.key,
    required this.title,
    required this.details,
    required this.subDetails,
  });

  final String title;
  final String details;
  final String? subDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // AssetsImage.svgRequestPaymentImage(),
        const SizedBox(height: 20),
        Text(
          "#$title",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        Text(
          details,
          style: context.theme.textTheme.displayMedium?.copyWith(
              color: appColor.black, fontSize: 24, fontWeight: FontWeight.w700),
        ),
        // const SizedBox(height: 6),
        if (subDetails != null)
          Text(
            subDetails!,
            style: context.theme.textTheme.bodyMedium
                ?.copyWith(color: appColor.darkGray, fontWeight: FontWeight.w700),
          ),
        const SizedBox(height: 4),
        OutlinedButton(
          onPressed: () {},
          child: Text(
            "Check this out",
            style: context.theme.textTheme.labelSmall
                ?.copyWith(color: appColor.white),
          ),
          style: OutlinedButton.styleFrom(
            backgroundColor: appColor.black.withOpacity(0.7),
          ),
        )
      ],
    );
  }
}

class SlideData {
  final String title;
  final String details;
  final String? subDetails;
  final Alignment? position;
  final String image;

  SlideData({
    required this.title,
    required this.details,
    this.subDetails,
    required this.image,
    this.position = Alignment.topLeft,
  });
}
