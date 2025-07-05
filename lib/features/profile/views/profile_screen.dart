// import 'package:flutter/material.dart';
// import 'package:project_shakti/core/theme/app_colors.dart';
// import 'package:project_shakti/core/theme/app_text_styles.dart';
// import 'package:project_shakti/core/utils/ui_helper.dart';
// import 'package:project_shakti/core/widgets/custom_button.dart';

// class ProfileScreen extends StatefulWidget {
//   final Function(ThemeMode)? onThemeChanged;

//   const ProfileScreen({super.key, this.onThemeChanged});

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen>
//     with TickerProviderStateMixin {
//   late AnimationController _fadeController;
//   late AnimationController _slideController;
//   late Animation<double> _fadeAnimation;
//   late Animation<Offset> _slideAnimation;

//   bool _isDarkMode = false;
//   bool _notificationsEnabled = true;
//   bool _locationSharing = true;

//   @override
//   void initState() {
//     super.initState();
//     _fadeController = AnimationController(
//       duration: const Duration(milliseconds: 800),
//       vsync: this,
//     );
//     _slideController = AnimationController(
//       duration: const Duration(milliseconds: 600),
//       vsync: this,
//     );

//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
//     );

//     _slideAnimation = Tween<Offset>(
//       begin: const Offset(0, 0.2),
//       end: Offset.zero,
//     ).animate(
//       CurvedAnimation(parent: _slideController, curve: Curves.elasticOut),
//     );

//     _fadeController.forward();
//     _slideController.forward();
//   }

//   @override
//   void dispose() {
//     _fadeController.dispose();
//     _slideController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final brightness = Theme.of(context).brightness;

//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [
//             AppColor.accentPink(brightness).withOpacity(0.1),
//             AppColor.background(brightness),
//             AppColor.accentBlue(brightness).withOpacity(0.05),
//           ],
//         ),
//       ),
//       child: Scaffold(
//         body: FadeTransition(
//           opacity: _fadeAnimation,
//           child: SlideTransition(
//             position: _slideAnimation,
//             child: SafeArea(
//               child: SingleChildScrollView(
//                 physics: const BouncingScrollPhysics(),
//                 child: Column(
//                   children: [
//                     // Header with Profile Info
//                     _buildProfileHeader(brightness),

//                     // Profile Stats
//                     _buildProfileStats(brightness),

//                     // Account Settings
//                     _buildAccountSettings(brightness),

//                     // App Settings
//                     _buildAppSettings(brightness),

//                     // Support & Info
//                     _buildSupportSection(brightness),

//                     // Sign Out Button
//                     _buildSignOutSection(brightness),

//                     UIHelper.getVerticalSpace(UIHelper.paddingLarge),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildProfileHeader(Brightness brightness) {
//     return Container(
//       padding: const EdgeInsets.all(24),
//       child: Column(
//         children: [
//           // Profile Picture with Edit Option
//           Stack(
//             children: [
//               Container(
//                 width: 100,
//                 height: 100,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   gradient: LinearGradient(
//                     colors: [
//                       AppColor.accentPink(brightness),
//                       AppColor.accentBlue(brightness),
//                     ],
//                   ),
//                   boxShadow: [
//                     BoxShadow(
//                       color: AppColor.accentPink(brightness).withOpacity(0.3),
//                       blurRadius: 20,
//                       spreadRadius: 5,
//                     ),
//                   ],
//                 ),
//                 // child: const Icon(Icons.person, size: 50, color: Colors.white),
//                 child: CircleAvatar(
//                   radius: 50,
//                   backgroundImage: NetworkImage(
//                     'https://media.licdn.com/dms/image/v2/D5603AQGcK_XVMtcqpw/profile-displayphoto-crop_800_800/B56Ze6FETPGQAM-/0/1751173581372?e=1756944000&v=beta&t=GW5gpAtpmggF2WtKFpo8T8ZC74HIpi3Sz1DGrduSYRU',
//                   ),
//                   backgroundColor: Colors.transparent,
//                 ),
//               ),
//               Positioned(
//                 bottom: 0,
//                 right: 0,
//                 child: GestureDetector(
//                   onTap: () {
//                     // Handle profile picture edit
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       color: AppColor.accentBlue(brightness),
//                       shape: BoxShape.circle,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.2),
//                           blurRadius: 8,
//                           offset: const Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     child: const Icon(
//                       Icons.camera_alt,
//                       size: 16,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),

//           UIHelper.getVerticalSpace(UIHelper.paddingMedium),

//           // Name and Edit Button
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'Rup Ki Rani',
//                 style: AppTextStyles.heading2(
//                   brightness,
//                 ).copyWith(fontWeight: FontWeight.w700),
//               ),
//               IconButton(
//                 onPressed: () {
//                   // Handle name edit
//                 },
//                 icon: Icon(
//                   Icons.edit_outlined,
//                   size: 20,
//                   color: AppColor.accentBlue(brightness),
//                 ),
//               ),
//             ],
//           ),

//           // Email
//           Text(
//             'rupkirani@gmail69.com',
//             style: AppTextStyles.body(brightness).copyWith(
//               color: AppTextStyles.body(brightness).color?.withOpacity(0.7),
//             ),
//           ),

//           UIHelper.getVerticalSpace(UIHelper.paddingSmall),

//           // Status Badge
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//             decoration: BoxDecoration(
//               color: Colors.green.withOpacity(0.1),
//               borderRadius: BorderRadius.circular(20),
//               border: Border.all(color: Colors.green.withOpacity(0.3)),
//             ),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Container(
//                   width: 8,
//                   height: 8,
//                   decoration: const BoxDecoration(
//                     color: Colors.green,
//                     shape: BoxShape.circle,
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 Text(
//                   'Verified Account',
//                   style: AppTextStyles.caption(
//                     brightness,
//                   ).copyWith(color: Colors.green, fontWeight: FontWeight.w600),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildProfileStats(Brightness brightness) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color:
//             brightness == Brightness.dark
//                 ? Colors.white.withOpacity(0.05)
//                 : Colors.white.withOpacity(0.7),
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(
//           color:
//               brightness == Brightness.dark
//                   ? Colors.white.withOpacity(0.1)
//                   : Colors.black.withOpacity(0.05),
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           _buildStatItem(
//             'Safe Trips',
//             '142',
//             Icons.shield_outlined,
//             brightness,
//           ),
//           _buildStatItem('Contacts', '8', Icons.people_outline, brightness),
//           _buildStatItem(
//             'Days Active',
//             '45',
//             Icons.calendar_today_outlined,
//             brightness,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildStatItem(
//     String label,
//     String value,
//     IconData icon,
//     Brightness brightness,
//   ) {
//     return Column(
//       children: [
//         Icon(icon, color: AppColor.accentPink(brightness), size: 28),
//         UIHelper.getVerticalSpace(UIHelper.paddingSmall),
//         Text(
//           value,
//           style: AppTextStyles.heading3(brightness).copyWith(
//             fontWeight: FontWeight.w700,
//             color: AppColor.accentBlue(brightness),
//           ),
//         ),
//         Text(
//           label,
//           style: AppTextStyles.caption(brightness).copyWith(
//             color: AppTextStyles.caption(brightness).color?.withOpacity(0.7),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildAccountSettings(Brightness brightness) {
//     final accountOptions = [
//       {
//         'title': 'Personal Information',
//         'subtitle': 'Update your details',
//         'icon': Icons.person_outline,
//       },
//       {
//         'title': 'Emergency Contacts',
//         'subtitle': 'Manage trusted contacts',
//         'icon': Icons.contacts_outlined,
//       },
//       {
//         'title': 'Privacy Settings',
//         'subtitle': 'Control your data',
//         'icon': Icons.privacy_tip_outlined,
//       },
//       {
//         'title': 'Security',
//         'subtitle': 'Password & authentication',
//         'icon': Icons.security_outlined,
//       },
//     ];

//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Account Settings',
//             style: AppTextStyles.heading3(
//               brightness,
//             ).copyWith(fontWeight: FontWeight.w700),
//           ),
//           UIHelper.getVerticalSpace(UIHelper.paddingMedium),
//           Container(
//             decoration: BoxDecoration(
//               color:
//                   brightness == Brightness.dark
//                       ? Colors.white.withOpacity(0.05)
//                       : Colors.white.withOpacity(0.7),
//               borderRadius: BorderRadius.circular(16),
//             ),
//             child: Column(
//               children:
//                   accountOptions.asMap().entries.map((entry) {
//                     int index = entry.key;
//                     Map<String, dynamic> option = entry.value;
//                     return _buildSettingsTile(
//                       option,
//                       brightness,
//                       isLast: index == accountOptions.length - 1,
//                     );
//                   }).toList(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildAppSettings(Brightness brightness) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'App Settings',
//             style: AppTextStyles.heading3(
//               brightness,
//             ).copyWith(fontWeight: FontWeight.w700),
//           ),
//           UIHelper.getVerticalSpace(UIHelper.paddingMedium),
//           Container(
//             decoration: BoxDecoration(
//               color:
//                   brightness == Brightness.dark
//                       ? Colors.white.withOpacity(0.05)
//                       : Colors.white.withOpacity(0.7),
//               borderRadius: BorderRadius.circular(16),
//             ),
//             child: Column(
//               children: [
//                 _buildSwitchTile(
//                   'Notifications',
//                   'Receive safety alerts',
//                   Icons.notifications_outlined,
//                   _notificationsEnabled,
//                   (value) {
//                     setState(() {
//                       _notificationsEnabled = value;
//                     });
//                   },
//                   brightness,
//                 ),
//                 _buildSwitchTile(
//                   'Location Sharing',
//                   'Share location with contacts',
//                   Icons.location_on_outlined,
//                   _locationSharing,
//                   (value) {
//                     setState(() {
//                       _locationSharing = value;
//                     });
//                   },
//                   brightness,
//                 ),
//                 _buildSwitchTile(
//                   'Dark Mode',
//                   'Use dark theme',
//                   Icons.dark_mode_outlined,
//                   _isDarkMode,
//                   (value) {
//                     setState(() {
//                       _isDarkMode = value;
//                     });
//                     widget.onThemeChanged?.call(
//                       value ? ThemeMode.dark : ThemeMode.light,
//                     );
//                   },
//                   brightness,
//                   isLast: true,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSupportSection(Brightness brightness) {
//     final supportOptions = [
//       {
//         'title': 'Help & Support',
//         'subtitle': 'Get help and contact us',
//         'icon': Icons.help_outline,
//       },
//       {
//         'title': 'About App',
//         'subtitle': 'Version info and credits',
//         'icon': Icons.info_outline,
//       },
//       {
//         'title': 'Rate App',
//         'subtitle': 'Share your feedback',
//         'icon': Icons.star_outline,
//       },
//     ];

//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Support & Info',
//             style: AppTextStyles.heading3(
//               brightness,
//             ).copyWith(fontWeight: FontWeight.w700),
//           ),
//           UIHelper.getVerticalSpace(UIHelper.paddingMedium),
//           Container(
//             decoration: BoxDecoration(
//               color:
//                   brightness == Brightness.dark
//                       ? Colors.white.withOpacity(0.05)
//                       : Colors.white.withOpacity(0.7),
//               borderRadius: BorderRadius.circular(16),
//             ),
//             child: Column(
//               children:
//                   supportOptions.asMap().entries.map((entry) {
//                     int index = entry.key;
//                     Map<String, dynamic> option = entry.value;
//                     return _buildSettingsTile(
//                       option,
//                       brightness,
//                       isLast: index == supportOptions.length - 1,
//                     );
//                   }).toList(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSignOutSection(Brightness brightness) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: CustomButton(
//         text: 'Sign Out',
//         onPressed: () {
//           _showSignOutDialog(brightness);
//         },

//         style: ElevatedButton.styleFrom(
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//           padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 100),
//         ),
//       ),
//     );
//   }

//   Widget _buildSettingsTile(
//     Map<String, dynamic> option,
//     Brightness brightness, {
//     bool isLast = false,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         border:
//             isLast
//                 ? null
//                 : Border(
//                   bottom: BorderSide(
//                     color:
//                         brightness == Brightness.dark
//                             ? Colors.white.withOpacity(0.1)
//                             : Colors.black.withOpacity(0.05),
//                     width: 0.5,
//                   ),
//                 ),
//       ),
//       child: ListTile(
//         leading: Container(
//           padding: const EdgeInsets.all(8),
//           decoration: BoxDecoration(
//             color: AppColor.accentBlue(brightness).withOpacity(0.1),
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Icon(
//             option['icon'],
//             color: AppColor.accentBlue(brightness),
//             size: 20,
//           ),
//         ),
//         title: Text(
//           option['title'],
//           style: AppTextStyles.body(
//             brightness,
//           ).copyWith(fontWeight: FontWeight.w600),
//         ),
//         subtitle: Text(
//           option['subtitle'],
//           style: AppTextStyles.caption(brightness).copyWith(
//             color: AppTextStyles.caption(brightness).color?.withOpacity(0.7),
//           ),
//         ),
//         trailing: Icon(
//           Icons.arrow_forward_ios,
//           size: 16,
//           color: AppTextStyles.body(brightness).color?.withOpacity(0.5),
//         ),
//         onTap: () {
//           // Handle navigation
//         },
//       ),
//     );
//   }

//   Widget _buildSwitchTile(
//     String title,
//     String subtitle,
//     IconData icon,
//     bool value,
//     Function(bool) onChanged,
//     Brightness brightness, {
//     bool isLast = false,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         border:
//             isLast
//                 ? null
//                 : Border(
//                   bottom: BorderSide(
//                     color:
//                         brightness == Brightness.dark
//                             ? Colors.white.withOpacity(0.1)
//                             : Colors.black.withOpacity(0.05),
//                     width: 0.5,
//                   ),
//                 ),
//       ),
//       child: ListTile(
//         leading: Container(
//           padding: const EdgeInsets.all(8),
//           decoration: BoxDecoration(
//             color: AppColor.accentPink(brightness).withOpacity(0.1),
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Icon(icon, color: AppColor.accentPink(brightness), size: 20),
//         ),
//         title: Text(
//           title,
//           style: AppTextStyles.body(
//             brightness,
//           ).copyWith(fontWeight: FontWeight.w600),
//         ),
//         subtitle: Text(
//           subtitle,
//           style: AppTextStyles.caption(brightness).copyWith(
//             color: AppTextStyles.caption(brightness).color?.withOpacity(0.7),
//           ),
//         ),
//         trailing: Switch(
//           value: value,
//           onChanged: onChanged,
//           activeColor: AppColor.accentPink(brightness),
//         ),
//       ),
//     );
//   }

//   void _showSignOutDialog(Brightness brightness) {
//     showDialog(
//       context: context,
//       builder:
//           (context) => AlertDialog(
//             backgroundColor:
//                 brightness == Brightness.dark
//                     ? AppColor.card(brightness)
//                     : Colors.white,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(16),
//             ),
//             title: Text('Sign Out', style: AppTextStyles.heading3(brightness)),
//             content: Text(
//               'Are you sure you want to sign out?',
//               style: AppTextStyles.body(brightness),
//             ),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: Text(
//                   'Cancel',
//                   style: TextStyle(color: AppColor.accentBlue(brightness)),
//                 ),
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                   // Handle sign out logic
//                 },
//                 child: const Text(
//                   'Sign Out',
//                   style: TextStyle(color: Colors.red),
//                 ),
//               ),
//             ],
//           ),
//     );
//   }
// }
