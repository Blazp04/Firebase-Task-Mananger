import 'package:firebase_task_menanger/_all.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  IFirebaseInterface firebaseInterface;
  TaskBloc({required this.firebaseInterface}) : super(TaskState(status: TaskStateStatus.initial)) {
    on<LoadDataEvent>(_loadData);
    on<AddNewTaskEvent>(_addNewTask);
    on<DeleteTaskEvent>(_deleteTask);
    on<UpdateDataEvent>(_updateTask);
  }

  Future _loadData(LoadDataEvent event, Emitter emit) async {
    emit(state.copyWith(status: TaskStateStatus.loading));
    final data = await firebaseInterface.getdata();
    emit(state.copyWith(status: TaskStateStatus.loaded, task: data));
  }

  Future _addNewTask(AddNewTaskEvent event, Emitter emit) async {
    bool success = await firebaseInterface.addNewTask('icon', 'title', 'text');
    if (success) {
      add(LoadDataEvent());
    } else {
      emit(state.copyWith(status: TaskStateStatus.error));
    }
  }

  Future _deleteTask(DeleteTaskEvent event, Emitter emit) async {
    bool success = await firebaseInterface.deleteData('-N_EPIne959F6nY4HqAt');
    if (success) {
      add(LoadDataEvent());
    } else {
      emit(state.copyWith(status: TaskStateStatus.error));
    }
  }

  Future _updateTask(UpdateDataEvent event, Emitter emit) async {
    bool success = await firebaseInterface.deleteData('-N_EPIne959F6nY4HqAt');
    if (success) {
      add(LoadDataEvent());
    } else {
      emit(state.copyWith(status: TaskStateStatus.error));
    }
  }
}
