import 'package:firebase_task_menanger/_all.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        TaskMenanger().routeName: (context) => TaskMenanger(),
      },
      home: TaskMenanger(),
    );
  }
}
