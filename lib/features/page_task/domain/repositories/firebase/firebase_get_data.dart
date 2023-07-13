import 'package:firebase_task_menanger/_all.dart';
import 'package:http/http.dart' as http;

abstract class IFirebaseInterface {
  Future<List<Task>> getdata();
  Future<bool> addNewTask(String icon, String title, String text);
  Future<bool> deleteData(String id);
}

class FirebaseData extends IFirebaseInterface {
  @override
  Future<List<Task>> getdata() async {
    final response = await http.get(Uri.parse('https://fir-task-menanger-default-rtdb.europe-west1.firebasedatabase.app/users/000/.json'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final taskData = jsonData['task'] as Map<String, dynamic>;

      final parentNames = taskData.keys.toList();
      final finalData = parentNames.map<Task>((parentName) {
        final taskDataItem = taskData[parentName] as Map<String, dynamic>;
        return Task.fromMap(taskDataItem).copyWith(id: parentName);
      }).toList();

      return finalData;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Future<bool> addNewTask(String icon, String title, String text) async {
    try {
      final request = http.post(
        Uri.parse('https://fir-task-menanger-default-rtdb.europe-west1.firebasedatabase.app/users/000/task/.json'),
        body: jsonEncode(
          <String, dynamic>{
            'icon': icon,
            'isActive': true,
            'title': title,
            'text': text,
          },
        ),
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteData(String id) async {
    try {
      final request = http.delete(Uri.parse('https://fir-task-menanger-default-rtdb.europe-west1.firebasedatabase.app/users/000/task/${id}/.json'));
      return true;
    } catch (e) {
      return false;
    }
  }
}
