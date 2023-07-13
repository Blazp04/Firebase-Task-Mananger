import 'package:firebase_task_menanger/_all.dart';

class TaskWidget extends StatelessWidget {
  TaskWidget({
    required this.subtitle,
    required this.title,
    required this.trailing,
    super.key,
  });

  String title;
  String subtitle;
  String trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: const Icon(Icons.list),
        trailing: Text(
          trailing,
          style: TextStyle(color: Colors.green, fontSize: 15),
        ),
        subtitle: Text(subtitle),
        title: Text(title));
  }
}
