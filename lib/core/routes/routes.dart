import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Import all screens
import 'package:project_shakti/features/add_friend/views/add_friend_screen.dart';
import 'package:project_shakti/features/bottom_nav/views/custom_bottom_nav.dart';
import 'package:project_shakti/features/community_sos/views/sosHelp_accept_screen.dart';
import 'package:project_shakti/features/community_sos/views/sosHelp_screen.dart';
import 'package:project_shakti/features/edit_friend/views/edit_friend_screen.dart';
import 'package:project_shakti/features/end_trip/views/end_trip.dart';
import 'package:project_shakti/features/home/views/home_screen.dart';
import 'package:project_shakti/features/live_trip/views/livetrip_screen.dart';
import 'package:project_shakti/features/login/views/login_screen.dart';
import 'package:project_shakti/features/notification/views/notification_screen.dart';
import 'package:project_shakti/features/onboarding/views/on_boarding_screen.dart';
import 'package:project_shakti/features/profile/views/profile_screen.dart';
import 'package:project_shakti/features/change_password/views/change_password_screen.dart';
import 'package:project_shakti/features/edit_profile/views/edit_profile_screen.dart';
import 'package:project_shakti/features/fake_call/views/fake_call.dart';
import 'package:project_shakti/features/friend_list/views/friend_list_page.dart';
import 'package:project_shakti/features/safe_call/views/start_trip_screen.dart';
import 'package:project_shakti/features/safety_tips/views/safety_tips_screen.dart';
import 'package:project_shakti/features/signup/views/signup_screen.dart';
import 'package:project_shakti/features/sos_options/view/sos_options_screen.dart';
import 'package:project_shakti/features/splash/views/splash_screen.dart';
import 'package:project_shakti/features/start_trip/views/start_trip_screen.dart';
import 'package:project_shakti/features/trip_history/views/trip_history_screen.dart';

/// Central route map to reduce duplication
Map<String, Widget Function(BuildContext)> getRoutes() {
  return {
    '/splash': (context) => const SplashScreen(),
    '/login': (context) => const LoginScreen(),
    '/signup': (context) => const SignUpScreen(),
    '/onBoarding': (context) => const OnBoardingScreen(),
    '/home': (context) => const HomeScreen(),
    '/bottom_nav': (context) => const CustomBottomNav(),
    '/profile': (context) => const ProfileScreen(),
    '/friendList': (context) => const FriendListPage(),
    '/addFriend': (context) => const AddFriendPage(),
    '/editFriend': (context) => const EditFriendPage(),
    '/changePassword': (context) => const ChangePasswordScreen(),
    '/editProfile': (context) => const EditProfileScreen(),
    '/fakeCall': (context) => const FakeCall(),
    '/startTrip': (context) => const TripMapScreen(),
    '/safeCall': (context) => const SafeCall(),
    '/endTrip': (context) => const EndTripScreen(),
    '/liveTrip': (context) => const LiveTripScreen(),
    '/sosControlSettings': (context) => const SosControlSettingsScreen(),
    '/safetyTips': (context) => const SafetyTipsScreen(),
    '/tripHistory': (context) => const TripHistoryScreen(),
    '/sosHelp': (context) => const SoshelpScreen(),
    '/sosHelpAccept': (context) => const SosHelpAcceptScreen(),
    '/notification': (context) => const NotificationScreen(),
  };
}

/// Main GoRouter instance
final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  routes:
      getRoutes().entries
          .map(
            (entry) => GoRoute(
              name: entry.key,
              path: entry.key,
              builder: (context, state) => entry.value(context),
            ),
          )
          .toList(),
  errorBuilder:
      (context, state) =>
          const Scaffold(body: Center(child: Text('Page not found'))),
);
