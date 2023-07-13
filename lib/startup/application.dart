import 'package:firebase_task_menanger/_all.dart';

import '../features/page_task/blocs/task_bloc/task_bloc.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return ContextProviderBlocs(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          TaskMenanger().routeName: (context) => TaskMenanger(),
        },
        home: TaskMenanger(),
      ),
    );
  }
}

class ContextProviderBlocs extends StatelessWidget {
  ContextProviderBlocs({
    required this.child,
    super.key,
  });
  Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TaskBloc(firebaseInterface: FirebaseData()),
        ),
      ],
      child: child,
    );
  }
}
