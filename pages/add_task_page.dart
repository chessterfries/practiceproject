import 'package:flutter/material.dart';
import 'package:practiceproject/pages/home_page.dart';
import 'package:practiceproject/pages/task.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  DateTime? _selectedDate;
  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _dateController.text =
        "${now.month.toString().padLeft(2, '0')}/${now.day.toString().padLeft(2, '0')}/${now.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0f766e),
        title: Text('Add New Task'),

        // BELOW IS HOW TO ADD AN ICON FOR THE BACK BUTTON (removed bc it looks bad rn): //

        // leading: IconButton(
        //   icon: Icon(Icons.close, color: Colors.red),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // )
      ),
      backgroundColor: Color(0xFFfffbeb),
      body: Column(
        children:<Widget>[
          SizedBox(height: 40),

          Container(
            width: 390,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 15),
            child: Text('Title:', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          ),
          
          Container(
            width: 390,
            height: 100,
            padding: EdgeInsets.only(left: 15),
            child: TextField(
              controller: _titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Title',
              ),
            ),
          ),
          
          Container(
            width: 390,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 15),
            child: Text('Description:', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.left),
          ),

          Container(
            width: 390,
            height: 300,
            padding: EdgeInsets.only(left: 15),
            child: TextField(
                      controller: _descriptionController,
                      expands: true,
                      maxLines: null,
                      decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Description',
                      hintStyle: TextStyle(fontSize: 20)
                    ),
            )
          ),

          SizedBox(height: 40),

          Container(
            width: 390,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 15),
            child: Text('Date/Time:', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          ),
          
          Container(
            width: 390,
            height: 100,
            padding: EdgeInsets.only(left: 15),
            child: TextField(
              controller: _dateController,
              readOnly: true, // THIS will make the thing selectable but not editable (hence the date picker)
              decoration: InputDecoration(
              border: OutlineInputBorder(),
             ),

             onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100)
                );

                if(pickedDate != null) {
                  setState(() {
                    _selectedDate = pickedDate;
                    _dateController.text = "${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.year}";
                  });
                }
             }
            )
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
              onPressed: () {
                if(_selectedDate != null) {
                  final task = Task(
                    title: _titleController.text,
                    description: _descriptionController.text,
                    date: _selectedDate!,
                  );

                  Navigator.pop(context, task);
                }
              },
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Color(0xFFd97706)),
                  foregroundColor: WidgetStateProperty.all(Color(0xFF292524)),
                  minimumSize: WidgetStateProperty.all(Size(300, 50))),
              child: Text(
                'Add Task',
                style: TextStyle(
                    fontSize: 23, fontFamily: 'Monospaced', fontWeight: FontWeight.bold),
              ),
            ),
          )
        ]
      )
    );
  }
}