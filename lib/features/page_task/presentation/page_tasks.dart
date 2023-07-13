import 'package:firebase_task_menanger/_all.dart';
import 'package:firebase_task_menanger/features/page_task/blocs/task_bloc/task_bloc.dart';

class TaskMenanger extends StatelessWidget {
  TaskMenanger({super.key});
  String routeName = 'taskMenanger';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Simple Task Menanger")),
      body: Column(
        children: const [
          AddNewTaskButton(),
          _TaskSection(),
        ],
      ),
    );
  }
}

class _TaskSection extends StatelessWidget {
  const _TaskSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        if (state.status == TaskStateStatus.initial || state.status == TaskStateStatus.loading) {
          return CircularProgressIndicator();
        }
        return Container(
          height: 600,
          child: ListView.builder(
              itemCount: state.task?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return TaskWidget(
                  title: state.task![index].title,
                  subtitle: state.task![index].text,
                  trailing: "ABC",
                );
              }),
        );
      },
    );
  }
}
