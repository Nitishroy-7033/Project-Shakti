import 'package:flutter/material.dart';
import 'package:project_shakti/features/AddFriendPage/views/AddFriendPage.dart';
import 'package:project_shakti/features/EditFriendPage/views/EditFriendPage.dart';
import 'package:project_shakti/features/LoginScreen/views/login_screen.dart';
import 'package:project_shakti/features/SignupScreen/views/signup_screen.dart';
import 'package:project_shakti/features/cangePassword_screen/views/changePassword_screen.dart';
import 'package:project_shakti/features/editProfile_screen/views/editProfile_screen.dart';
import 'package:project_shakti/features/fake_call/views/fake_call.dart';
import 'package:project_shakti/features/friend_list_page/views/friend_list_page.dart';

import 'package:project_shakti/features/profile_Screen/views/profile_Screen.dart';

import 'package:project_shakti/features/splash_screen/views/splash_screen.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String home = '/home';

  static const String login = '/login';
  static const String signup = '/signup';
  static const String profile = '/profile';
  static const String friendList = '/friend_list';
  static const String addFriend = '/add_friend';
  static const String editFriend = '/edit_friend';
  static const String changePassword = '/change_password';
  static const String editProfile = '/edit_profile';
  static const String fakeCall = '/fake_call';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      splash: (context) => const SplashScreen(),
      login: (context) => const LoginScreen(),
      signup: (context) => const SignUpScreen(),
      profile: (context) => const ProfileScreen(),
      friendList: (context) => const FriendListPage(),
      addFriend: (context) => const AddFriendPage(),
      editFriend: (context) => const EditFriendPage(),
      changePassword: (context) => const ChangePasswordScreen(),
      editProfile: (context) => const EditProfileScreen(),
      fakeCall: (context) => const FakeCall(),
    };
  }
}
