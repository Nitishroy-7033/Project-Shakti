import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_shakti/core/constants/app_icons.dart';
import 'package:project_shakti/features/bottom_nav/cubit/custom_nav_cubit.dart';

class CustomNavContainer extends StatelessWidget {
  const CustomNavContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(
              context,
            ).colorScheme.onPrimaryContainer.withValues(alpha: 0.1),
            blurRadius: 5,
            offset: Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomNavButton(icon: AppIcons.home, label: "Home", index: 0),
          CustomNavButton(icon: AppIcons.bolt, label: "Start Trip", index: 1),
          CustomNavButton(icon: AppIcons.emergency, label: "SOS", index: 2),
          CustomNavButton(
            icon: AppIcons.phoneTalk,
            label: "Emergency",
            index: 3,
          ),
          CustomNavButton(
            icon: AppIcons.schedule,
            label: "Trip History",
            index: 4,
          ),
        ],
      ),
    );
  }
}

class CustomNavButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final int index;
  const CustomNavButton({
    super.key,
    required this.icon,
    required this.label,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.read<CustomNavCubit>().jumpToIndex(index),
      child: BlocBuilder<CustomNavCubit, int>(
        builder: (context, selectedIndex) {
          bool isSelected = selectedIndex == index;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withValues(
                    alpha: isSelected ? 0.3 : 0.0,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.all(6),
                child: Icon(
                  icon,
                  size: 24,
                  color:
                      isSelected
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.tertiary,
                ),
              ),
              SizedBox(height: 7),
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color:
                      isSelected
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.tertiary,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
