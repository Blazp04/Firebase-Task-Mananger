// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'task_bloc.dart';

@immutable
abstract class TaskEvent {}

class LoadDataEvent extends TaskEvent {}

class AddNewTaskEvent extends TaskEvent {
  String title;
  String text;
  AddNewTaskEvent({
    required this.title,
    required this.text,
  });
}

class DeleteTaskEvent extends TaskEvent {
  String id;
  DeleteTaskEvent({
    required this.id,
  });
}

class UpdateDataEvent extends TaskEvent {
  String id;
  String icon;
  String title;
  String text;
  bool isActive;
  UpdateDataEvent({
    required this.id,
    required this.icon,
    required this.title,
    required this.text,
    required this.isActive,
  });
}
