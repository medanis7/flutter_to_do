import 'package:flutter/material.dart';
import 'package:flutter_to_do/widgets/counter.dart';
import 'package:flutter_to_do/widgets/todocard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoApp(),
    );
  }
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});
  @override
  State<TodoApp> createState() => _TodoAppState();
}

class Task {
  String title;
  bool status;
  Task({
    required this.title,
    required this.status,
  });
}

class _TodoAppState extends State<TodoApp> {
  final myController = TextEditingController();
  List tasks = [
    Task(title: "استغفر الله", status: false),
  ];
  changeS(int ind) {
    setState(() {
      tasks[ind].status = !tasks[ind].status;
    });
  }

  dele(int iii) {
    setState(() {
      tasks.remove(tasks[iii]);
    });
  }

  int done() {
    int j = 0;
    tasks.forEach((item) {
      if (item.status == true) {
        j += 1;
      }
    });
    return j;
  }

  myfun() {
    setState(() {
      tasks.add(Task(title: myController.text, status: false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 0.7),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(58, 66, 86, 1),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  tasks.length = 0;
                });
              },
              icon: Icon(
                Icons.delete,
                size: 40,
                color: Color.fromARGB(255, 190, 104, 104),
              ))
        ],
        elevation:100,
        title: Text(
          "TO DO LIST",
          style: TextStyle(
              fontSize: 33, color: Colors.white,
               fontWeight: FontWeight.bold,fontStyle: FontStyle.italic, ),
        ),
        
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            alignment: Alignment.center,
            width: double.infinity,
            child: Counter(a: done(), b: tasks.length),
          ),
          SizedBox(
            height: 620,
            child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (BuildContext context, index) {
                  return todocard(
                    vartitle: tasks[index].title,
                    doneOrNot: tasks[index].status,
                    changeStatus: changeS,
                    ii: index,
                    del: dele,
                  );
                }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(41)),
                child: Container(
                  height: 200,
                  padding: EdgeInsets.all(22),
                  color: Color.fromARGB(0, 255, 255, 255),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: myController,
                        maxLength: 19,
                        decoration:
                            InputDecoration(labelText: "add a new task"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextButton(
                        onPressed: () {
                          
                          myfun();
                          Navigator.pop(context);
                        },
                        child: Text(
                          "ADD",
                          style: TextStyle(fontSize: 23),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(78, 48, 141, 141),
      ),
    );
  }
}
