import 'package:firebase_task_menanger/_all.dart';

extension StringValidator on String {
  String? validateText() {
    if (isEmpty) {
      return 'Text ne može biti prazan';
    }
    if (length >= 300) {
      return 'Maximalna dužina teksta je 300 karaktera';
    }
    return null;
  }
}
