import 'package:bloc/bloc.dart';
import 'package:firebase_task_menanger/_all.dart';
import 'package:meta/meta.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  IFirebaseInterface firebaseInterface;
  TaskBloc({required this.firebaseInterface}) : super(TaskState(status: TaskStateStatus.initial)) {
    on<LoadDataEvent>(_loadData);
  }

  Future _loadData(LoadDataEvent event, Emitter emit) async {
    emit(state.copyWith(status: TaskStateStatus.loading));
    final data = await firebaseInterface.getdata();
    emit(state.copyWith(status: TaskStateStatus.loaded, task: data));
  }
}
