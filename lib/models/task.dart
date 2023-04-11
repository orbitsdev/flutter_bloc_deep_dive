import 'dart:convert';

import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String name;
  bool? isDone;
  bool? isDeleted;

  Task({
    required this.name,
    this.isDone = false,
    this.isDeleted = false,
  });

  Task copyWith({
    String? name,
    bool? isDone,
    bool? isDeleted,
  }) {
    return Task(
      name: name ?? this.name,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      name: map['name'] ?? '',
      isDone: map['isDone'],
      isDeleted: map['isDeleted'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source));

  @override
  String toString() =>
      'Task(name: $name, isDone: $isDone, isDeleted: $isDeleted)';

  @override
  List<Object> get props => [name, isDone as bool, isDeleted as bool];
}
