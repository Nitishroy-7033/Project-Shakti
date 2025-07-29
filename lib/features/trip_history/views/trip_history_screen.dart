import 'package:flutter/material.dart';
import 'package:project_shakti/core/theme/app_colors.dart';
import 'package:project_shakti/core/theme/app_text_styles.dart';
import '../models/trip_model.dart';
import '../widgets/trip_card_widget.dart';

class TripHistoryScreen extends StatefulWidget {
  const TripHistoryScreen({super.key});

  @override
  State<TripHistoryScreen> createState() => _TripHistoryScreenState();
}

class _TripHistoryScreenState extends State<TripHistoryScreen> {
  final List<Trip> _allTrips = [
    Trip(
      fromLocation: 'Car street, Halasuru',
      toLocation: 'Gaya, Bihar, 834002',
      leaveTime: '10:00 AM',
      reachedTime: '12:00 AM',
      distance: '2.5 Km',
      status: TripStatus.safe,
    ),
    Trip(
      fromLocation: 'Car street, Halasuru',
      toLocation: 'Gaya, Bihar, gaya',
      leaveTime: '10:00 AM',
      reachedTime: '12:00 AM',
      distance: '2.5 Km',
      status: TripStatus.notSafe,
    ),
    Trip(
      fromLocation: 'Car street, Halasuru',
      toLocation: 'Gaya, Bihar, 834002',
      leaveTime: '10:00 AM',
      reachedTime: '12:00 AM',
      distance: '2.5 Km',
      status: TripStatus.safe,
    ),
  ];

  List<Trip> _filteredTrips = [];
  String _selectedFilter = 'all';

  @override
  void initState() {
    super.initState();
    _filteredTrips = _allTrips;
  }

  void _applyFilter(String filter) {
    setState(() {
      _selectedFilter = filter;
      if (filter == 'all') {
        _filteredTrips = _allTrips;
      } else if (filter == 'safe') {
        _filteredTrips =
            _allTrips.where((trip) => trip.status == TripStatus.safe).toList();
      } else if (filter == 'notSafe') {
        _filteredTrips =
            _allTrips
                .where((trip) => trip.status == TripStatus.notSafe)
                .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Trip History',
          style: AppTextStyles.appBarTitle(brightness),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(
              Icons.filter_list,
              color:
                  brightness == Brightness.light
                      ? AppColors.fontLight
                      : AppColors.fontDark,
            ),
            onSelected: _applyFilter,
            itemBuilder:
                (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: 'all',
                    child: Text(
                      'All Trips',
                      style: AppTextStyles.body(brightness),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'safe',
                    child: Text(
                      'Safe Trips Only',
                      style: AppTextStyles.body(brightness),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'notSafe',
                    child: Text(
                      'Not Safe Trips Only',
                      style: AppTextStyles.body(brightness),
                    ),
                  ),
                ],
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body:
          _filteredTrips.isEmpty
              ? Center(
                child: Text(
                  'No trips to display for the selected filter.',
                  style: AppTextStyles.body(brightness),
                  textAlign: TextAlign.center,
                ),
              )
              : ListView.builder(
                itemCount: _filteredTrips.length,
                itemBuilder: (context, index) {
                  return TripCardWidget(trip: _filteredTrips[index]);
                },
              ),
    );
  }
}
