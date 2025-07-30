import 'package:flutter/material.dart';
import 'package:project_shakti/core/routes/routes.dart';
import 'package:project_shakti/core/utils/sharedpref_helper.dart';
import 'package:project_shakti/features/onboarding/widgets/emergency_alert_page.dart';
import 'package:project_shakti/features/onboarding/widgets/location_review_page.dart';
import 'package:project_shakti/features/onboarding/widgets/share_location_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final SharedPrefsHelper _prefsHelper = SharedPrefsHelper();

  //controller to keep track of which page we're on
  final PageController _controller = PageController();
  //keep track of if we are in the last page or not
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //page view
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [
              EmergencyAlertPage(),
              ShareLocationPage(),
              LocationReviewPage(),
            ],
          ),
          //dot indicators
          Container(
            alignment: Alignment(0, 0.8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    activeDotColor: Theme.of(context).colorScheme.primary,
                    dotColor: Theme.of(context).colorScheme.tertiary,
                    dotHeight: 10,
                    dotWidth: 10,
                  ),
                ),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //skip
                      GestureDetector(
                        onTap: () {
                          _controller.animateToPage(
                            2,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Text(
                          'Skip',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      //next or done
                      GestureDetector(
                        onTap: () async {
                          if (onLastPage) {
                            await _prefsHelper.setOnboarded(
                              true,
                            ); // ← this line
                            Navigator.pushReplacementNamed(context, '/login');
                          } else {
                            _controller.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          }
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            onLastPage
                                ? Icons.check
                                : Icons.arrow_forward_rounded,
                            color: Theme.of(context).colorScheme.onPrimary,
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
