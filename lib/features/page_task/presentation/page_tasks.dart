import 'package:firebase_task_menanger/_all.dart';
import 'package:firebase_task_menanger/features/page_task/blocs/task_bloc/task_bloc.dart';

class TaskMenanger extends StatelessWidget {
  TaskMenanger({super.key});
  String routeName = 'taskMenanger';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Simple Task Menanger",
          style: TextStyle(color: darkGrayColor),
        ),
        backgroundColor: backGroundColor,
        shadowColor: Colors.yellow,
        centerTitle: true,
      ),
      backgroundColor: backGroundColor,
      body: const Column(
        children: [
          // AddNewTaskButton()
          _TaskSection(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: darkGreenColor,
        child: const Icon(Icons.add),
        onPressed: () {
          AddNewTaskDialog(context);
        },
      ),
    );
  }
}

class _TaskSection extends StatefulWidget {
  const _TaskSection();

  @override
  State<_TaskSection> createState() => _TaskSectionState();
}

class _TaskSectionState extends State<_TaskSection> {
  @override
  void initState() {
    context.read<TaskBloc>().add(LoadDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        if (state.status == TaskStateStatus.initial || state.status == TaskStateStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        return SizedBox(
          height: MediaQuery.of(context).size.height - 80,
          child: RefreshIndicator(
            onRefresh: () async {
              context.read<TaskBloc>().add(LoadDataEvent());
            },
            child: ListView.builder(
                itemCount: state.task?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return TaskWidget(
                    title: state.task![index].title,
                    subtitle: state.task![index].text,
                    id: state.task![index].id!,
                    isActive: state.task![index].isActive,
                  );
                }),
          ),
        );
      },
    );
  }
}
