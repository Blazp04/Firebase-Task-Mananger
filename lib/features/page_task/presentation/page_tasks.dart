import 'package:firebase_task_menanger/_all.dart';

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
          TaskSection(),
        ],
      ),
    );
  }
}

class TaskSection extends StatelessWidget {
  const TaskSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return TaskWidget(
              title: "List item $index",
              subtitle: "Ovo je neki tekst",
              trailing: "ABC",
            );
          }),
    );
  }
}
