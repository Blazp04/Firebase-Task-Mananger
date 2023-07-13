part of 'task_bloc.dart';

@immutable
abstract class TaskEvent {}

class LoadDataEvent extends TaskEvent {}

class AddNewTaskEvent extends TaskEvent {}

class DeleteTaskEvent extends TaskEvent {}

class UpdateDataEvent extends TaskEvent {}
