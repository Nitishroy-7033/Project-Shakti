class SOSHistory {
  final String status;
  final String distance;
  final String time;
  final String location;
  final String? howmanyaccepted;

  SOSHistory({
    required this.status,
    required this.distance,
    required this.time,
    required this.location,
    this.howmanyaccepted,
  });
}
