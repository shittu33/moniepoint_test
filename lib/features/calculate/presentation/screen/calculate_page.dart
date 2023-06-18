import 'package:flutter/material.dart';
import 'package:moniepoint_test/core/assets.dart';
import 'package:moniepoint_test/core/dimensions.dart';
import 'package:moniepoint_test/core/theme.dart';
import 'package:moniepoint_test/core/theme_extension.dart';
import 'package:moniepoint_test/features/calculate/presentation/widget/calculate_appbar.dart';
import 'package:moniepoint_test/features/calculate/presentation/widget/calculate_succes_page.dart';
import 'package:moniepoint_test/features/calculate/presentation/widget/type_writer_input.dart';
import 'package:moniepoint_test/features/home/presentation/screen/home_screen.dart';
import 'package:moniepoint_test/features/home/presentation/widget/page_wrapper.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
          width: double.infinity,
          margin: EdgeInsets.all(14),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14.0),
              ),
              onPressed: () {
                Navigator
                    .of(context)
                    .push(MaterialPageRoute(
                    builder: (_) => CalcSuccessPage()));
                },
              child: Text(
                "Calculate",
                style: context.theme.textTheme.titleMedium
                    ?.copyWith(fontSize: 18, color: appColor.white),
              ))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CalculatorAppBar(),
            const SizedBox(
              height: Dims.appVertGap,
            ),
            PageWrapper(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dims.appSideGap, vertical: Dims.appVertGap),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Destination",
                        style: context.theme.textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 12),
                      Container(
                        decoration: BoxDecoration(
                            color: appColor.white,
                            boxShadow: [
                              BoxShadow(
                                color: appColor.gray.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset: const Offset(
                                    0, 1), // changes the position of the shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: Dims.appSideGap,
                            vertical: Dims.appSideGap * 1.1),
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: buildInputDecoration(sendBox,hintText: "Sender Location"),
                            ),
                            const SizedBox(height: 12),
                            TextFormField(
                              decoration: buildInputDecoration(receiveBox,hintText: "Receiver Location"),
                            ),
                            const SizedBox(height: 12),
                            TextFormField(
                              decoration: buildInputDecoration(scale,hintText: "Approx Weight"),
                            ),
                            // const SizedBox(height: 12),
                          ],
                        ),
                      ),
                      const SizedBox(height: Dims.appSideGap * 2),
                      Text(
                        "Packaging",
                        style: context.theme.textTheme.headlineMedium,
                      ),
                      Text(
                        "What are you sending",
                        style: context.theme.textTheme.titleMedium?.copyWith(
                            color: appColor.gray, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        decoration: BoxDecoration(
                            color: appColor.white,
                            boxShadow: [
                              BoxShadow(
                                color: appColor.gray.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset: const Offset(
                                    0, 1), // changes the position of the shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: DropdownButtonFormField<String>(
                          value: "Box",
                          decoration: buildInputDecoration(shipItem,
                              fillColor: appColor.white),
                          items: ["Box", "Envelope"]
                              .map((e) =>
                              DropdownMenuItem(
                                child: Text(e),
                                value: e,
                              ))
                              .toList(),
                          onChanged: (String? value) {},
                        ),
                      ),
                      const SizedBox(height: Dims.appSideGap * 2),
                      Text(
                        "Categories",
                        style: context.theme.textTheme.headlineMedium,
                      ),
                      Text(
                        "What are you sending",
                        style: context.theme.textTheme.titleMedium?.copyWith(
                            color: appColor.gray, fontWeight: FontWeight.w500),
                      ),
                      Wrap(
                        spacing: 12,
                        children: [
                          "Documents",
                          "Glass",
                          "Liquid",
                          "Food",
                          "Electronics",
                          "Products",
                        ]
                            .map((e) {
                          var selected = e == "Electronics" || e == "Glass";
                          return FilterChip(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(color: appColor.gray),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 6, horizontal: 4),
                            backgroundColor: appColor.background,
                            selectedColor: appColor.black,
                            avatar:
                            selected ? Icon(Icons.check) : null,
                            label: Text(
                              e,
                              style: TextStyle(
                                  color: selected
                                      ? appColor.white
                                      : appColor.black),
                            ),
                            selected: selected,
                            onSelected: (bool value) {},
                          );
                        })
                            .toList(),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration(String prefixImage, {Color? fillColor,String? hintText}) {
    return InputDecoration(
      fillColor: fillColor,
      hintText: hintText,
      hintStyle: appTheme.light.textTheme.titleMedium
          ?.copyWith(color: appColor.gray),
      prefixIconConstraints:  BoxConstraints(maxHeight: prefixImage==shipItem?30.0:20, maxWidth: 63),
      // constraints: const BoxConstraints(maxHeight: 43),
      prefixIcon: Row(
        children: [
          Padding(
              padding:  EdgeInsets.only(left: 18.0, top: 2),
              child: Image.asset(prefixImage)),
          SizedBox(width: 8),
          Container(
            color: appColor.gray,
            width: 1,
            height: 32,
          ),
        ],
      ),
    );
  }
}
