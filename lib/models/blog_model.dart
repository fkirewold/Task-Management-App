// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BlogModel {
  final int id;
  final String title;
  final String body;
  BlogModel({
    required this.id,
    required this.title,
    required this.body,
  });

  BlogModel copyWith({
    int? id,
    String? title,
    String? body,
  }) {
    return BlogModel(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory BlogModel.fromMap(Map<String, dynamic> map) {
    return BlogModel(
      id: map['id'] as int,
      title: map['title'] as String,
      body: map['body'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BlogModel.fromJson(String source) =>
      BlogModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'BlogModel(id: $id, title: $title, body: $body)';

  @override
  bool operator ==(covariant BlogModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.title == title && other.body == body;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ body.hashCode;
}
