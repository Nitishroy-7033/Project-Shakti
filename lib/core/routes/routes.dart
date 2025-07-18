import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_shakti/core/service/service_locator.dart';
import 'package:project_shakti/features/add_friend/views/add_friend_screen.dart';
import 'package:project_shakti/features/bottom_nav/views/custom_bottom_nav.dart';
import 'package:project_shakti/features/edit_friend/views/edit_friend_screen.dart';
import 'package:project_shakti/features/home/views/home_screen.dart';
import 'package:project_shakti/features/login/domain/usecase/login_usecase.dart';
import 'package:project_shakti/features/login/presentation/bloc/login_bloc.dart';
import 'package:project_shakti/features/login/presentation/views/login_screen.dart';
import 'package:project_shakti/features/onboarding/views/on_boarding_screen.dart';
import 'package:project_shakti/features/profile/views/profile_screen.dart';
import 'package:project_shakti/features/signup/domain/repository/sign_up_repository.dart';
import 'package:project_shakti/features/signup/domain/usecase/signup_usecase.dart';
import 'package:project_shakti/features/signup/presentation/bloc/signup_bloc.dart';
import 'package:project_shakti/features/signup/presentation/views/signup_screen.dart';
import 'package:project_shakti/features/change_password/views/change_password_screen.dart';
import 'package:project_shakti/features/edit_profile/views/edit_profile_screen.dart';
import 'package:project_shakti/features/fake_call/views/fake_call.dart';
import 'package:project_shakti/features/friend_list/views/friend_list_page.dart';
import 'package:project_shakti/features/splash/views/splash_screen.dart';
import 'package:project_shakti/features/start_trip/views/start_trip_screen.dart';

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
  static const String bottomNav = '/bottom_nav';
  static const String onBoarding = '/onBoarding';
  static const String startTrip = '/startTrip';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      splash: (context) => const SplashScreen(),
      // login: (context) => const LoginScreen(),
      login: (context) => BlocProvider(
            create: (_) => LoginBloc(loginUseCase: getIt<LoginUseCase>()),
            child: const LoginScreen(),
          ),
      // signup: (context) => const SignUpScreen(),
      // ✅ Wrapped SignupScreen with BlocProvider
      signup:
          (context) => BlocProvider(
            create:
                (_) => SignUpBloc(
                  signupUseCase: getIt<SignupUseCase>(),
                ),
            child: SignUpScreen(),
          ),
      profile: (context) => const ProfileScreen(),
      friendList: (context) => const FriendListPage(),
      addFriend: (context) => const AddFriendPage(),
      editFriend: (context) => const EditFriendPage(),
      changePassword: (context) => const ChangePasswordScreen(),
      editProfile: (context) => const EditProfileScreen(),
      fakeCall: (context) => const FakeCall(),
      home: (context) => const HomeScreen(),
      bottomNav: (context) => const CustomBottomNav(),
      onBoarding: (context) => const OnBoardingScreen(),
      startTrip: (context) => const TripMapScreen(),
    };
  }
}
