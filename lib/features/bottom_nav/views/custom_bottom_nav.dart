import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_shakti/features/bottom_nav/cubit/custom_nav_cubit.dart';
import 'package:project_shakti/features/bottom_nav/widgets/custom_nav_container.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomNavCubit(),
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: CustomNavContainer(),
          body: BlocBuilder<CustomNavCubit, int>(
            builder: (context, selectedIndex) {
              final customNavCubit = context.read<CustomNavCubit>();
              return PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: customNavCubit.pageController,
                children: customNavCubit.pages,
              );
            },
          ),
        ),
      ),
    );
  }
}
