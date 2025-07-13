import 'package:flutter/material.dart';
import 'package:project_shakti/core/routes/routes.dart';
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
            alignment: Alignment(0, 0.75),
            child: SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //skip
                  GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Color(0xFF4B30CC),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SmoothPageIndicator(controller: _controller, count: 3),
                  //next or done
                  onLastPage
                      ? GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.login);
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0xFF4B30CC),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                      )
                      : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xFF4B30CC),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Skip button
// TextButton(
// onPressed: () {
// // Navigate to main app or login
// Navigator.pushReplacementNamed(context, '/main');
// },
// child: Text(
// 'Skip',
// style: TextStyle(
// color: Color(0xFFE91E63),
// fontSize: 16,
// fontWeight: FontWeight.w500,
// ),
// ),
// ),
//
// // Next button
// GestureDetector(
// onTap: () {
// if (_currentPage < _pages.length - 1) {
// _pageController.nextPage(
// duration: Duration(milliseconds: 300),
// curve: Curves.easeInOut,
// );
// } else {
// // Last page - navigate to main app
// Navigator.pushReplacementNamed(context, '/main');
// }
// },
