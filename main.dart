import 'package:flutter/material.dart';
import 'package:practiceproject/pages/home_page.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final List<List<dynamic>> toDoList = [
//     ['Buy groceries', false],
//     ['Walk the dog', false],
//   ];

//   final TextEditingController _textController = TextEditingController();

//   void _addNewTask(String task) {
//     setState(() {
//       toDoList.add([task, false]);
//     });
//     _textController.clear();
//   }

//   void _toggleDone(int index) {
//     setState(() {
//       toDoList[index][1] = !toDoList[index][1];
//     });
//   }

//   void _deleteTask(int index) {
//     setState(() {
//       toDoList.removeAt(index);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Center(
//           child: Text("My Tasks", style: TextStyle(color: Colors.white)),
//         ),
//       ),
      
//     );
//   }
// }