import 'package:graduation_mobile/models/has_id.dart';

class Permission implements HasId {
  @override
  int? id;
  static String table = "permissions";
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  Permission(
      {this.id,
      required this.name,
      required this.createdAt,
      required this.updatedAt});

  factory Permission.fromJson(Map<String, dynamic> json) {
    return Permission(
      id: json['id'],
      name: json['name'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
