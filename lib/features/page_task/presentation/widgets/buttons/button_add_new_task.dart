import 'package:firebase_task_menanger/_all.dart';

class AddNewTaskButton extends StatelessWidget {
  const AddNewTaskButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.red,
        height: 100,
        child: ElevatedButton(
          child: const Text("Dodaj novi zadatak"),
          onPressed: () {},
        ),
      ),
    );
  }
}
