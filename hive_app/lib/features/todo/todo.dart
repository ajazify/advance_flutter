import 'package:flutter/material.dart';
import 'package:hive_app/features/todo/todo_controller.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  final TodoController todoController = TodoController();
  List<TextEditingController> controllers = List.generate(5, (_) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text('Hive'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                mTextFormField(textController: controllers[0], title: 'Name'),
                mTextFormField(textController: controllers[1], title: 'Email'),
                mTextFormField(textController: controllers[2], title: 'Phone'),
                mTextFormField(textController: controllers[3], title: 'Website'),
                mTextFormField(textController: controllers[4], title: 'Username'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        todoController.writeData(
                            name: controllers[0].text,
                            email: controllers[1].text,
                            phone: controllers[2].text,
                            website: controllers[3].text,
                            username: controllers[4].text);
                        snackMessenger(message: 'Added User Details');
                      },
                      child: const Text('Write'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        var userData = todoController.readData();
                        snackMessenger(message: userData.toString());
                      },
                      child: const Text('Read'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        todoController.deleteData();

                        snackMessenger(message: 'Deleted User Details');
                      },
                      child: const Text('Delete'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void snackMessenger({required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      margin: const EdgeInsets.all(16.0), 
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 1), 
      content: Text(message),
    ));
  }

  Padding mTextFormField({required TextEditingController textController, required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        controller: textController,
        decoration: InputDecoration(
          labelText: title,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
