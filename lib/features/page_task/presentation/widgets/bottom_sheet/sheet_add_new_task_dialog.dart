import 'package:firebase_task_menanger/_all.dart';
import 'package:firebase_task_menanger/features/page_task/blocs/task_bloc/task_bloc.dart';

void AddNewTaskDialog(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.all(20),
        child: MyForm(),
      );
    },
  );
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleTextEditingController = TextEditingController();
  final TextEditingController _textEditingController = TextEditingController();

  String _textFieldValue = '';
  String _titleFieldValue = '';

  void _saveData(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<TaskBloc>().add(AddNewTaskEvent(title: _titleFieldValue, text: _textFieldValue));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _titleTextEditingController,
            decoration: InputDecoration(
              labelText: 'Unesite naslov',
            ),
            onChanged: (value) {
              setState(() {
                _titleFieldValue = value;
              });
            },
          ),
          TextFormField(
            controller: _textEditingController,
            decoration: const InputDecoration(
              labelText: 'Unesite detalje o zadatku',
            ),
            validator: (value) => value!.validateText(),
            onChanged: (value) {
              setState(() {
                _textFieldValue = value;
              });
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color?>(darkGreenColor),
            ),
            onPressed: () {
              _textFieldValue.length < 300 ? _saveData(context) : null;
            },
            child: const Text('Dodaj zadatak'),
          ),
        ],
      ),
    );
  }
}
