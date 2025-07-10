import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_shakti/features/change_password/views/change_password_screen.dart';
import 'package:project_shakti/features/edit_friend/views/edit_friend_screen.dart';
import 'package:project_shakti/features/fake_call/views/fake_call.dart';
import 'package:project_shakti/features/friend_list/views/friend_list_page.dart';
import 'package:project_shakti/features/home/views/home_screen.dart';

class CustomNavCubit extends Cubit<int> {
  final PageController pageController = PageController();
  CustomNavCubit() : super(0);

  final List<Widget> pages = const [
    HomeScreen(),
    FriendListPage(),
    ChangePasswordScreen(),
    FakeCall(),
    EditFriendPage(),
  ];

  void jumpToIndex(int index) {
    pageController.jumpToPage(index);
    emit(index);
  }
}
