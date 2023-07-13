// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Task {
  String text;
  String title;
  String icon;
  bool isActive;
  Task({
    required this.text,
    required this.title,
    required this.icon,
    required this.isActive,
  });

  Task copyWith({
    String? text,
    String? title,
    String? icon,
    bool? isActive,
  }) {
    return Task(
      text: text ?? this.text,
      title: title ?? this.title,
      icon: icon ?? this.icon,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'title': title,
      'icon': icon,
      'isActive': isActive,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      text: map['text'] as String,
      title: map['title'] as String,
      icon: map['icon'] as String,
      isActive: map['isActive'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Task(text: $text, title: $title, icon: $icon, isActive: $isActive)';
  }

  @override
  bool operator ==(covariant Task other) {
    if (identical(this, other)) return true;

    return other.text == text && other.title == title && other.icon == icon && other.isActive == isActive;
  }

  @override
  int get hashCode {
    return text.hashCode ^ title.hashCode ^ icon.hashCode ^ isActive.hashCode;
  }
}
