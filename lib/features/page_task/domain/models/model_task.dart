// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Task {
  String text;
  String title;
  String icon;
  bool isActive;
  String? id;
  Task({
    required this.text,
    required this.title,
    required this.icon,
    required this.isActive,
    this.id,
  });

  Task copyWith({
    String? text,
    String? title,
    String? icon,
    bool? isActive,
    String? id,
  }) {
    return Task(
      text: text ?? this.text,
      title: title ?? this.title,
      icon: icon ?? this.icon,
      isActive: isActive ?? this.isActive,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'title': title,
      'icon': icon,
      'isActive': isActive,
      'id': id,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      text: map['text'] as String,
      title: map['title'] as String,
      icon: map['icon'] as String,
      isActive: map['isActive'] as bool,
      id: map['id'] != null ? map['id'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Task(text: $text, title: $title, icon: $icon, isActive: $isActive, id: $id)';
  }

  @override
  bool operator ==(covariant Task other) {
    if (identical(this, other)) return true;

    return other.text == text && other.title == title && other.icon == icon && other.isActive == isActive && other.id == id;
  }

  @override
  int get hashCode {
    return text.hashCode ^ title.hashCode ^ icon.hashCode ^ isActive.hashCode ^ id.hashCode;
  }
}
