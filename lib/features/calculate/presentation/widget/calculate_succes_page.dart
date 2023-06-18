import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moniepoint_test/core/assets.dart';
import 'package:moniepoint_test/core/theme.dart';
import 'package:moniepoint_test/core/theme_extension.dart';
import 'package:moniepoint_test/features/home/presentation/widget/page_wrapper.dart';

class CalcSuccessPage extends StatelessWidget {
  const CalcSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor.white.withOpacity(0.98),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PageWrapper(
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(logo),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 28.0),
                              child: Image.asset(box2),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Text(
                              'Total Estimated Amount',
                              style: context.theme.textTheme.titleSmall
                                  ?.copyWith(fontSize: 26, wordSpacing: -4),
                            ),
                            CountDownCurrency(),
                            Text(
                              'The amount is estimated this vary if you change your location or weight',
                              textAlign: TextAlign.center,
                              style: context.theme.textTheme.titleSmall
                                  ?.copyWith(fontSize: 16, wordSpacing: 0.1),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 14.0),
                            ),
                            onPressed: () {
                              var navigatorState = Navigator.of(context);
                              navigatorState.pop();
                              if (navigatorState.canPop()) {
                                navigatorState.pop();
                              }
                            },
                            child: Text(
                              "Back to home",
                              style: context.theme.textTheme.titleMedium
                                  ?.copyWith(
                                      fontSize: 18, color: appColor.white),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CountDownCurrency extends StatefulWidget {
  const CountDownCurrency({
    super.key,
  });

  @override
  State<CountDownCurrency> createState() => _CountDownCurrencyState();
}

class _CountDownCurrencyState extends State<CountDownCurrency>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  final int _startValue = 0;
  final int _endValue = 1432;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    if (_animationController != null) {
      _animation = Tween<double>(
        begin: _startValue.toDouble(),
        end: _endValue.toDouble(),
      ).animate(CurvedAnimation(
        parent: _animationController!,
        curve: Curves.easeInOut,
      ));
    }

    _animationController?.forward();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _animationController == null
        ? SizedBox()
        : AnimatedBuilder(
            animation: _animationController!,
            builder: (BuildContext context, Widget? child) {
              return Text.rich(
                TextSpan(
                    children: [
                      TextSpan(text: "\$${ _animation?.value.toInt().toString()}"),
                      TextSpan(
                          text: " USD",
                          style: context.theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: appColor.success)),
                    ],
                    style: context.theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w400, color: appColor.success)),
                style: TextStyle(color: appColor.success),
              );
            },
          );
  }
}
