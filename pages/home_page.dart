import 'package:flutter/material.dart';
import 'package:practiceproject/pages/add_task_page.dart';
import 'package:practiceproject/pages/task.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Task> myToDoList = <Task>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfffbeb),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'My Tasks',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Color(0xFF0f766e),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: myToDoList.length,
              itemBuilder: (BuildContext context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Card(
                    child: ListTile(
                    onTap: () {},
                    title: Text(myToDoList[index].title),
                    subtitle: Text(myToDoList[index].description),
                    trailing: Text(
                      "${myToDoList[index].date.month}/${myToDoList[index].date.day}/${myToDoList[index].date.year}",
                    ),
                    leading: Checkbox(
                          value: myToDoList[index].isCompleted,
                          onChanged: (bool? newValue) {
                            setState(() {
                              myToDoList[index].isCompleted = newValue!;
                            });
                          },
                        ),
                  ),
                  )
                  
                  
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
              onPressed: () async {
                final Task? newTask = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddTaskPage())
                );

                if(newTask != null) {
                  setState(() {
                    myToDoList.add(newTask);
                  });
                }
                
              },
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Color(0xFFd97706)),
                  foregroundColor: WidgetStateProperty.all(Color(0xFF292524)),
                  minimumSize: WidgetStateProperty.all(Size(300, 50))),
              child: Text(
                'New Task',
                style: TextStyle(
                    fontSize: 23, fontFamily: 'Monospaced', fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
