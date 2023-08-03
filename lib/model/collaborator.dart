import 'dart:convert';

class CollaboratorModel {
  int id;
  String name;
  String picture;
  bool status;
  CollaboratorModel({
    required this.id,
    required this.name,
    required this.picture,
    required this.status,
  });

  CollaboratorModel copyWith({
    int? id,
    String? name,
    String? picture,
    bool? status,
  }) {
    return CollaboratorModel(
      id: id ?? this.id,
      name: name ?? this.name,
      picture: picture ?? this.picture,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'picture': picture,
      'status': status,
    };
  }

  factory CollaboratorModel.fromMap(Map<String, dynamic> map) {
    return CollaboratorModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      picture: map['picture'] ?? '',
      status: map['status'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory CollaboratorModel.fromJson(Map<String, dynamic> source) =>
      CollaboratorModel.fromMap(source);

  @override
  String toString() {
    return 'CollaboratorModel(id: $id, name: $name, picture: $picture, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CollaboratorModel &&
        other.id == id &&
        other.name == name &&
        other.picture == picture &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ picture.hashCode ^ status.hashCode;
  }
}
