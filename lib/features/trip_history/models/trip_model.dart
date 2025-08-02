enum TripStatus { safe, notSafe }

class Trip {
  final String fromLocation;
  final String toLocation;
  final String leaveTime;
  final String reachedTime;
  final String distance;
  final TripStatus status;

  Trip({
    required this.fromLocation,
    required this.toLocation,
    required this.leaveTime,
    required this.reachedTime,
    required this.distance,
    required this.status,
  });
}
