class Activity {
  final int id;
  final DateTime date;
  final String name;

  Activity({
    required this.id,
    required this.date,
    required this.name,
  });

  // Convierte la instancia a un Map para SQLite
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'date': date.toIso8601String(), // Guardar como String ISO
      'name': name,
    };
  }

  // Crea una instancia desde un Map (por ejemplo, desde SQLite)
  factory Activity.fromMap(Map<String, dynamic> map) {
    return Activity(
      id: map['id'],
      date: DateTime.parse(map['date']), // Convertir String a DateTime
      name: map['name'],
    );
  }

  @override
  String toString() {
    return 'Activity{id: $id, date: $date, name: $name}';
  }
}
