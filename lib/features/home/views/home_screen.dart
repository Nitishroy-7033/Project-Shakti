import 'package:flutter/material.dart';
import 'package:project_shakti/core/constants/app_icons.dart';
import 'package:project_shakti/core/constants/app_strings.dart';
import 'package:project_shakti/core/theme/app_colors.dart';
import 'package:project_shakti/core/utils/ui_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int safetyScore = 85;
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              UIHelper.getVerticalSpace(UIHelper.paddingLarge),
              _buildQuickActionsGrid(),
              SizedBox(height: 20),
              _buildSafetyStatsCard(),
              SizedBox(height: 20),
              _buildSmartAssistantTip(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.appNameLower,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 36,
                ),
              ),
              Text(
                AppStrings.empowertinYourJourney,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            AppIcons.notification,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        UIHelper.getHorizontalSpace(UIHelper.paddingMedium),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/profile');
          },
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
            width: 36,
            height: 36,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                "https://imgv3.fotor.com/images/slider-image/A-clear-close-up-photo-of-a-woman.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActionsGrid() {
    final actions = [
      {
        'icon': AppIcons.schedule,
        'title': 'Schedule\nTrip',
        'color': Colors.blue,
      },
      {
        'icon': AppIcons.checkCircle,
        'title': 'Check-In',
        'color': Colors.orange,
      },
      {
        'icon': AppIcons.emergency,
        'title': 'SOS\nAlert',
        'color': Colors.red,
        'isSOS': true,
      },
      {'icon': AppIcons.group, 'title': 'Community', 'color': Colors.pink},
      {
        'icon': AppIcons.contactPhone,
        'title': 'Emergency\nContacts',
        'color': Colors.redAccent,
      },
      {'icon': AppIcons.phoneTalk, 'title': 'Fake\nCall', 'color': Colors.teal},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            "Quick Actions",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        UIHelper.getVerticalSpace(UIHelper.paddingMedium),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.85,
          ),
          itemCount: actions.length,
          itemBuilder: (context, index) {
            final action = actions[index];
            final isSOS = action['isSOS'] == true;

            return InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                if (isSOS) {
                  _showSOSDialog();
                } else {}
              },
              child: AnimatedBuilder(
                animation: _pulseController,
                builder: (context, child) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: (action['color'] as Color).withValues(
                              alpha: 0.1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            action['icon'] as IconData,
                            color: action['color'] as Color,
                            size: 24,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          action['title'] as String,
                          style: Theme.of(
                            context,
                          ).textTheme.labelSmall?.copyWith(
                            color:
                                Theme.of(
                                  context,
                                ).colorScheme.onPrimaryContainer,
                            fontWeight: FontWeight.w500,
                            height: 1.2,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildSafetyStatsCard() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Today's Safety Score",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    _getSafetyStatusText(),
                    style: TextStyle(
                      fontSize: 12,
                      color: _getSafetyColor(),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => _showSafetyTips(),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.secondary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        AppIcons.lightBulb,
                        color: Theme.of(context).colorScheme.secondary,
                        size: 14,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "Tips",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          UIHelper.getVerticalSpace(UIHelper.paddingMedium),
          Row(
            children: [
              Text(
                "$safetyScore",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: _getSafetyColor(),
                ),
              ),
              Text(
                " /100",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: _getSafetyColor().withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(_getSafetyIcon(), color: _getSafetyColor(), size: 16),
                    SizedBox(width: 4),
                    Text(
                      _getSafetyLabel(),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: _getSafetyColor(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Container(
            height: 6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: Theme.of(
                context,
              ).colorScheme.surface.withValues(alpha: 0.1),
            ),
            child: FractionallySizedBox(
              widthFactor: safetyScore / 100,
              alignment: Alignment.centerLeft,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  gradient: LinearGradient(
                    colors: [
                      _getSafetyColor(),
                      _getSafetyColor().withValues(alpha: 0.7),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSmartAssistantTip() {
    final tips = [
      {
        "icon": Icons.location_off,
        "title": "Location Privacy",
        "tip": "Share location only with trusted contacts",
      },
      {
        "icon": Icons.dark_mode,
        "title": "Night Safety",
        "tip": "Avoid poorly lit areas after dark",
      },
      {
        "icon": Icons.people,
        "title": "Stay Connected",
        "tip": "Keep emergency contacts updated",
      },
      {
        "icon": Icons.directions_walk,
        "title": "Be Alert",
        "tip": "Stay aware of your surroundings",
      },
      {
        "icon": Icons.phone,
        "title": "Quick Access",
        "tip": "Keep emergency numbers handy",
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            "Safety Tips",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        UIHelper.getVerticalSpace(UIHelper.paddingMedium),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: tips.length,
            itemBuilder: (context, index) {
              final tip = tips[index];
              return Container(
                width: 200,
                margin: EdgeInsets.only(right: 12, left: index == 0 ? 4 : 0),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          tip["icon"] as IconData,
                          color: Theme.of(context).colorScheme.primary,
                          size: 20,
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            tip["title"] as String,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color:
                                  Theme.of(
                                    context,
                                  ).colorScheme.onPrimaryContainer,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      tip["tip"] as String,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Color _getSafetyColor() {
    if (safetyScore >= 80) return AppColors.successColor;
    if (safetyScore >= 60) return Colors.orange;
    return AppColors.errorColor;
  }

  String _getSafetyLabel() {
    if (safetyScore >= 80) return "Safe";
    if (safetyScore >= 60) return "Moderate";
    return "High Risk";
  }

  String _getSafetyStatusText() {
    if (safetyScore >= 80) return "You're in a safe zone";
    if (safetyScore >= 60) return "Stay alert and cautious";
    return "High risk area detected";
  }

  IconData _getSafetyIcon() {
    if (safetyScore >= 80) return Icons.check_circle;
    if (safetyScore >= 60) return Icons.warning;
    return Icons.error;
  }

  void _showSOSDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning_rounded,
                  size: 30,
                  color: Theme.of(context).colorScheme.primary,
                ),
                SizedBox(width: 8),
                Text(
                  "Emergency SOS",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),

            content: Text(
              "Are you sure you want to send an emergency alert?",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                child: Text(
                  "Send SOS",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
            ],
          ),
    );
  }

  void _showSafetyTips() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder:
          (context) => Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Safety Tips",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: 16),
                Text(
                  "• Share your location with trusted contacts\n• Avoid poorly lit areas\n• Stay aware of surroundings\n• Keep emergency contacts updated",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ButtonStyle(elevation: WidgetStatePropertyAll(0.0)),
                  child: Text("Got it"),
                ),
              ],
            ),
          ),
    );
  }
}
