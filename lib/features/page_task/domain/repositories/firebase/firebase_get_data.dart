import 'package:firebase_task_menanger/_all.dart';
import 'package:http/http.dart' as http;

abstract class IFirebaseInterface {
  Future<List<Task>> getdata();
  Future<bool> addNewTask({required String icon, required String title, required String text});
  Future<bool> deleteData(String id);
  Future<bool> updateTask({required String id, required String icon, required String title, required String text, required bool isActive});
}

class FirebaseData extends IFirebaseInterface {
  @override
  Future<List<Task>> getdata() async {
    final response = await http.get(Uri.parse('${AppSettings().firebaseURL}/users/000/.json'));

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
  Future<bool> addNewTask({required String icon, required String title, required String text}) async {
    try {
      final request = http.post(
        Uri.parse('${AppSettings().firebaseURL}/users/000/task/.json'),
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

  @override
  Future<bool> deleteData(String id) async {
    try {
      final request = await http.delete(Uri.parse('${AppSettings().firebaseURL}/users/000/task/$id/.json'));
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> updateTask({required String id, required String icon, required String title, required String text, required bool isActive}) async {
    final body = jsonEncode({
      id: {
        "icon": icon,
        "isActive": !isActive,
        "text": text,
        "title": title,
      }
    });
    final response = await http.patch(
      Uri.parse('${AppSettings().firebaseURL}/users/000/task/.json'),
      body: body,
    );
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
