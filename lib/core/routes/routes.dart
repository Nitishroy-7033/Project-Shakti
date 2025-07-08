import 'package:flutter/material.dart';
import 'package:project_shakti/features/add_friend/views/add_friend_screen.dart';
import 'package:project_shakti/features/edit_friend/views/edit_friend_screen.dart';
import 'package:project_shakti/features/home/views/home_screen.dart';
import 'package:project_shakti/features/login/views/login_screen.dart';
import 'package:project_shakti/features/signup/views/signup_screen.dart';
import 'package:project_shakti/features/change_password/views/change_password_screen.dart';
import 'package:project_shakti/features/edit_profile/views/edit_profile_screen.dart';
import 'package:project_shakti/features/fake_call/views/fake_call.dart';
import 'package:project_shakti/features/friend_list/views/friend_list_page.dart';

import 'package:project_shakti/features/profile/views/profile_screen.dart';

import 'package:project_shakti/features/splash/views/splash_screen.dart';

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
      // profile: (context) => const ProfileScreen(),
      friendList: (context) => const FriendListPage(),
      addFriend: (context) => const AddFriendPage(),
      editFriend: (context) => const EditFriendPage(),
      changePassword: (context) => const ChangePasswordScreen(),
      editProfile: (context) => const EditProfileScreen(),
      fakeCall: (context) => const FakeCall(),
      home: (context)=> const HomeScreen(),
    };
  }
}
