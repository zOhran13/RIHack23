// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../utils/global_variables.dart';

class Event {
  final int id;
  final String name;
  final String description;
  final String location;
  final DateTime date;
  final int capacity;
  final int going;
  final int points;
  final EventType type;

  Event({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.date,
    required this.capacity,
    required this.going,
    required this.points,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'location': location,
      'date': date.millisecondsSinceEpoch,
      'capacity': capacity,
      'going': going,
      'points': points,
      'type': type.toString(),
    };
  }

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      location: map['location'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      capacity: map['capacity'] as int,
      going: map['going'] as int,
      points: map['points'] as int,
      type: EventType.values.byName(map['type']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Event.fromJson(String source) =>
      Event.fromMap(json.decode(source) as Map<String, dynamic>);
}
