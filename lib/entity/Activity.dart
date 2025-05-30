class Activity {
  final int id;
  final DateTime date;
  final String name;

  Activity({
    required this.id,
    required this.date,
    required this.name,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'name': name,
    };
  }
  factory Activity.fromMap(Map<String, dynamic> map) {
    return Activity(
      id: map['id'],
      date: DateTime.parse(map['date']),
      name: map['name'],
    );
  }

  @override
  String toString() {
    return 'Activity{id: $id, date: $date, name: $name}';
  }
}
