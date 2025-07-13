import 'package:flutter/material.dart';
import 'package:project_shakti/core/theme/app_colors.dart';
import 'package:project_shakti/core/utils/ui_helper.dart';
import 'package:project_shakti/core/widgets/custom_button.dart';

class ProfileScreen extends StatefulWidget {
  final Function(ThemeMode)? onThemeChanged;

  const ProfileScreen({super.key, this.onThemeChanged});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;

  bool _isDarkMode = false;
  bool _notificationsEnabled = true;
  bool _locationSharing = true;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Theme.of(context).colorScheme.primary),
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // Header with Profile Info
            _buildProfileHeader(),

            // Profile Stats
            _buildProfileStats(),

            // Account Settings
            _buildAccountSettings(),

            // App Settings
            _buildAppSettings(),

            // Support & Info
            _buildSupportSection(),

            // Sign Out Button
            _buildSignOutSection(),

            UIHelper.getVerticalSpace(UIHelper.paddingLarge),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          // Profile Picture with Edit Option
          Stack(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  'https://media.licdn.com/dms/image/v2/D5603AQGcK_XVMtcqpw/profile-displayphoto-crop_800_800/B56Ze6FETPGQAM-/0/1751173581372?e=1756944000&v=beta&t=GW5gpAtpmggF2WtKFpo8T8ZC74HIpi3Sz1DGrduSYRU',
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    // Handle profile picture edit
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.blackCommon.withValues(alpha: 0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      size: 16,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),

          UIHelper.getVerticalSpace(UIHelper.paddingMedium),

          // Name and Edit Button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              Text(
                'Rup Ki Rani',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/edit_profile');
                },
                icon: Icon(
                  Icons.edit_outlined,
                  size: 20,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),

          // Email
          Text(
            'rupkirani@gmail69.com',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),

          UIHelper.getVerticalSpace(UIHelper.paddingSmall),

          // Status Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.successColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.successColor),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: AppColors.successColor,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Verified Account',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: AppColors.successColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileStats() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem('Safe Trips', '142', Icons.shield_outlined),
          _buildStatItem('Contacts', '8', Icons.people_outline),
          _buildStatItem('Days Active', '45', Icons.calendar_today_outlined),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.primary, size: 28),
        UIHelper.getVerticalSpace(UIHelper.paddingSmall),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      ],
    );
  }

  Widget _buildAccountSettings() {
    final accountOptions = [
      {
        'title': 'Personal Information',
        'subtitle': 'Update your details',
        'icon': Icons.person_outline,
      },
      {
        'title': 'Emergency Contacts',
        'subtitle': 'Manage trusted contacts',
        'icon': Icons.contacts_outlined,
      },
      {
        'title': 'Privacy Settings',
        'subtitle': 'Control your data',
        'icon': Icons.privacy_tip_outlined,
      },
      {
        'title': 'Security',
        'subtitle': 'Password & authentication',
        'icon': Icons.security_outlined,
      },
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Account Settings',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
          UIHelper.getVerticalSpace(UIHelper.paddingMedium),
          Column(
            children:
                accountOptions.asMap().entries.map((entry) {
                  int index = entry.key;
                  Map<String, dynamic> option = entry.value;
                  return _buildSettingsTile(
                    option,
                    () {},
                    isLast: index == accountOptions.length - 1,
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildAppSettings() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'App Settings',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
          UIHelper.getVerticalSpace(UIHelper.paddingMedium),
          Column(
            children: [
              _buildSwitchTile(
                'Notifications',
                'Receive safety alerts',
                Icons.notifications_outlined,
                _notificationsEnabled,
                (value) {
                  setState(() {
                    _notificationsEnabled = value;
                  });
                },
              ),
              _buildSwitchTile(
                'Location Sharing',
                'Share location with contacts',
                Icons.location_on_outlined,
                _locationSharing,
                (value) {
                  setState(() {
                    _locationSharing = value;
                  });
                },
              ),
              _buildSwitchTile(
                'Dark Mode',
                'Use dark theme',
                Icons.dark_mode_outlined,
                _isDarkMode,
                (value) {
                  setState(() {
                    _isDarkMode = value;
                  });
                  widget.onThemeChanged?.call(
                    value ? ThemeMode.dark : ThemeMode.light,
                  );
                },
                isLast: true,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSupportSection() {
    final supportOptions = [
      {
        'title': 'Help & Support',
        'subtitle': 'Get help and contact us',
        'icon': Icons.help_outline,
      },
      {
        'title': 'About App',
        'subtitle': 'Version info and credits',
        'icon': Icons.info_outline,
      },
      {
        'title': 'Rate App',
        'subtitle': 'Share your feedback',
        'icon': Icons.star_outline,
      },
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Support & Info',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
          UIHelper.getVerticalSpace(UIHelper.paddingMedium),
          Column(
            children:
                supportOptions.asMap().entries.map((entry) {
                  int index = entry.key;
                  Map<String, dynamic> option = entry.value;
                  return _buildSettingsTile(
                    option,
                    () {},
                    isLast: index == supportOptions.length - 1,
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsTile(
    Map<String, dynamic> option,
    VoidCallback onTap, {
    bool isLast = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        border:
            isLast
                ? null
                : Border(
                  bottom: BorderSide(
                    color: Theme.of(
                      context,
                    ).colorScheme.onPrimaryContainer.withValues(alpha: 0.2),
                    width: 0.5,
                  ),
                ),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(
              context,
            ).colorScheme.secondary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            option['icon'],
            color: Theme.of(context).colorScheme.secondary,
            size: 20,
          ),
        ),
        title: Text(
          option['title'],
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          option['subtitle'],
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        onTap: onTap,
      ),
    );
  }

  Widget _buildSwitchTile(
    String title,
    String subtitle,
    IconData icon,
    bool value,
    Function(bool) onChanged, {
    bool isLast = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        border:
            isLast
                ? null
                : Border(
                  bottom: BorderSide(
                    color: Theme.of(
                      context,
                    ).colorScheme.onPrimaryContainer.withValues(alpha: 0.2),
                    width: 0.5,
                  ),
                ),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(
              context,
            ).colorScheme.secondary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: Theme.of(context).colorScheme.secondary,
            size: 20,
          ),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        trailing: Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  Widget _buildSignOutSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: CustomButton(
        text: 'Sign Out',
        onPressed: () {
          _showSignOutDialog();
        },
      ),
    );
  }

  void _showSignOutDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Text(
              'Sign Out',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            content: Text(
              'Are you sure you want to sign out?',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Cancel',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Handle sign out logic
                  Navigator.pop(context);
                },
                child: Text(
                  'Sign Out',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ),
            ],
          ),
    );
  }
}
