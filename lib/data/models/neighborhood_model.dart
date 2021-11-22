import 'dart:convert';

class NeighborhoodModel {
  final int? id;
  final String? name;
  final DateTime? created;
  final DateTime? modified;
  NeighborhoodModel({
    this.id,
    this.name,
    this.created,
    this.modified,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'created': created?.millisecondsSinceEpoch,
      'modified': modified?.millisecondsSinceEpoch,
    };
  }

  factory NeighborhoodModel.fromMap(Map<String, dynamic> map) {
    return NeighborhoodModel(
      id: map['id'] ?? map['id'],
      name: map['name'] ?? map['name'],
      created: map['created'] != null ? DateTime.fromMillisecondsSinceEpoch(map['created']) : null,
      modified: map['modified'] != null ? DateTime.fromMillisecondsSinceEpoch(map['modified']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NeighborhoodModel.fromJson(String source) => NeighborhoodModel.fromMap(json.decode(source));
}
