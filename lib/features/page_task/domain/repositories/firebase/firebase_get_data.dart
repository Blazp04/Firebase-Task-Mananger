import 'package:firebase_task_menanger/_all.dart';
import 'package:http/http.dart' as http;

abstract class IFirebaseInterface {
  Future<List<Task>> getdata();
}

class FirebaseData extends IFirebaseInterface {
  @override
  Future<List<Task>> getdata() async {
    final response = await http.get(Uri.parse('https://fir-task-menanger-default-rtdb.europe-west1.firebasedatabase.app/users/000/.json'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final taskList = jsonData['task'] as List<dynamic>;

      return taskList.map<Task>((taskData) => Task.fromMap(taskData)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
