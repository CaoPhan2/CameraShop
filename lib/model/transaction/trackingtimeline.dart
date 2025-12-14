class TrackingTimeline {
  final String date;
  final String time;
  final String description;
  final bool isCompleted;

  TrackingTimeline({
    required this.date,
    required this.time,
    required this.description,
    required this.isCompleted,
  });

  factory TrackingTimeline.fromJson(Map<String, dynamic> json) {
    return TrackingTimeline(
      date: json['date'],
      time: json['time'],
      description: json['description'],
      isCompleted: json['isCompleted'],
    );
  }
}
