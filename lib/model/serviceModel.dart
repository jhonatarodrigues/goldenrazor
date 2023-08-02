import 'dart:convert';

class ServiceModel {
  int id;
  String title;
  double price;
  String averageTime;
  bool status;

  ServiceModel({
    required this.id,
    required this.title,
    required this.price,
    required this.averageTime,
    required this.status,
  });

  ServiceModel copyWith({
    int? id,
    String? title,
    double? price,
    String? averageTime,
    bool? status,
  }) {
    return ServiceModel(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      averageTime: averageTime ?? this.averageTime,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'averageTime': averageTime,
      'status': status,
    };
  }

  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      averageTime: map['averageTime'] ?? '',
      status: map['status'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceModel.fromJson(Map<String, dynamic> source) =>
      ServiceModel.fromMap(source);

  @override
  String toString() {
    return 'ServiceModel(id: $id, title: $title, price: $price, averageTime: $averageTime, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ServiceModel &&
        other.id == id &&
        other.title == title &&
        other.price == price &&
        other.averageTime == averageTime &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        price.hashCode ^
        averageTime.hashCode ^
        status.hashCode;
  }
}
