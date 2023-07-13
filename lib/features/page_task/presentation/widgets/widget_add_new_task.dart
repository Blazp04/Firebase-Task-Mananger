import 'package:firebase_task_menanger/_all.dart';
import 'package:firebase_task_menanger/features/page_task/blocs/task_bloc/task_bloc.dart';

class TaskWidget extends StatelessWidget {
  TaskWidget({
    required this.subtitle,
    required this.title,
    required this.id,
    required this.isActive,
    super.key,
  });

  String title;
  String subtitle;
  String id;
  bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Container(
        padding: const EdgeInsets.all(20),
        height: 203,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          color: isActive ? backgroundGreenColor : backgroundGrayColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                color: isActive ? darkGreenColor : darkGrayColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              subtitle,
              style: TextStyle(
                color: isActive ? textGreenColor : textGrayColor,
                fontSize: 17,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 5),
            Divider(thickness: 2, color: isActive ? darkGreenColor : darkGrayColor),
            Container(
              height: 45,
              child: Row(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color?>(isActive ? darkGreenColor : darkGrayColor),
                    ),
                    child: isActive ? const Text('Završi') : const Text('Vrati'),
                    onPressed: () {
                      context.read<TaskBloc>().add(
                            UpdateDataEvent(
                              id: id,
                              icon: 'null',
                              title: title,
                              text: subtitle,
                              isActive: isActive,
                            ),
                          );
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color?>(isActive ? darkOrangeColor : darkGrayColor),
                    ),
                    child: const Text('Poništi zadatak'),
                    onPressed: () {
                      context.read<TaskBloc>().add(DeleteTaskEvent(id: id));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
