// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'task_bloc.dart';

class TaskState {
  List<Task>? task;
  TaskStateStatus status;

  TaskState({this.task, required this.status});

  TaskState copyWith({
    List<Task>? task,
    TaskStateStatus? status,
  }) {
    return TaskState(
      task: task ?? this.task,
      status: status ?? this.status,
    );
  }
}
