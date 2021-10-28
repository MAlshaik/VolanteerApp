import 'package:VolanteerApp/model/settings.dart';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

class User {
  
  final String id;
  final String name;
  final String imagePath; 
  final Settings settings;

  const User({
    this.id = '',
    this.name = '',
    // this.dateOfBirth,
    this.imagePath = '',    
    this.settings = const Settings(),
  });

  User copy({
    String id,
    String name,
    DateTime dateOfBirth,
    String imagePath,
    List<String> pets,
    Settings settings,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        // dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        imagePath: imagePath ?? this.imagePath,
        settings: settings ?? this.settings,
      );

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        // dateOfBirth: DateTime.tryParse(json['dateOfBirth']),
        imagePath: json['imagePath'],
        settings: Settings.fromJson(json['settings']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      // 'dateOfBirth': dateOfBirth.toIso8601String(),
        'imagePath': imagePath,
        'settings': settings.toJson(),
      };

  @override
  String toString() => 'User{id: $id, name: $name}';
}
