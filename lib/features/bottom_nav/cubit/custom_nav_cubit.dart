import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_shakti/features/change_password/views/change_password_screen.dart';
import 'package:project_shakti/features/community_sos/views/sosHelp_accept_screen.dart';
import 'package:project_shakti/features/community_sos/views/sosHelp_screen.dart';
import 'package:project_shakti/features/home/views/home_screen.dart';
import 'package:project_shakti/features/safe_call/views/start_trip_screen.dart';
import 'package:project_shakti/features/start_trip/views/start_trip_screen.dart';
import 'package:project_shakti/features/trip_history/views/trip_history_screen.dart';

class CustomNavCubit extends Cubit<int> {
  final PageController pageController = PageController();
  CustomNavCubit() : super(0);

  final List<Widget> pages = const [
    HomeScreen(),
    TripMapScreen(),
    SosHelpAcceptScreen(),
    SafeCall(),
    TripHistoryScreen(),
  ];

  void jumpToIndex(int index) {
    pageController.jumpToPage(index);
    emit(index);
  }
}
