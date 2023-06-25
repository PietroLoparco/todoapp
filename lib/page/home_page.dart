import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/model/todo.dart';
import 'package:todoapp/model/todo_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
 
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final todoList = todo.todoList();
    final todoControllerAddtasks= TextEditingController();

  List<todo>finalTodoList=[];

  @override
  void initState() {
    finalTodoList=todoList;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color.fromARGB(255, 34, 34, 32),
      drawer: const Drawer(
        backgroundColor:Color.fromRGBO(28, 30, 19,1),
      ),

      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 34, 34, 32),
        leading: IconButton
        (
          icon: const Icon(CupertinoIcons.bars), 
          color: Colors.white,
          onPressed: () {_scaffoldKey.currentState?.openDrawer();},),
      ),

    body: Stack(
      children: [
      Column(
        children: [
          Row( 
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(CupertinoIcons.home, color: Colors.white, size: MediaQuery.of(context).size.width * 0.08,),
              responsiveText("welcome to your to do list",  0.06, Colors.white,)
            ],
          ),
          line(Colors.white),

          Expanded(
              child: ListView(
                children: [
                  for(todo todos in finalTodoList.reversed)
                  TodoWidget(
                    todos: todos,
                    checkboxChange: checkboxFunction, 
                    deleteTask: deleteFunction)
                ]) ,
            )
        ],
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          children: [
                Expanded(
                  child: Container(
                   margin: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                   padding: const EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                   decoration: BoxDecoration(
                     color: const Color.fromRGBO(12, 38, 70, 4),
                     borderRadius: BorderRadius.circular(17),
                     border: Border.all(
                       color: const Color.fromRGBO(42, 38, 48, 1),
                     ),
                     boxShadow: const [
                        BoxShadow(
                          spreadRadius: 0,
                          offset: Offset(0, 0),
                          blurRadius: 10,
                        ),
                     ],
                   ),
                child: TextField(
                  cursorColor: Colors.amber[900],
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      controller: todoControllerAddtasks,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        
                    ),
                  )
                )
              ),
            Container(
              margin: const EdgeInsets.only(right: 20,bottom: 20),
              padding: const EdgeInsets.only(top: 5,bottom: 5),
              child: ElevatedButton (
                onPressed: () {
                  if(todoControllerAddtasks.text != ''){
                    addTodo(todoControllerAddtasks.text);
                  }
                  else{
                    //message "the todo is empity"
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('The todo is empity')),);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(12, 38, 70, 1),
                  elevation: 30,
                  shadowColor: const Color.fromARGB(255, 0, 0, 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17)
                ),
              ),
                child: const Text("+", style: TextStyle(fontSize: 40, color: Colors.white,)),
              )
            )
          ],
        ),
      )
    ]),

    );
  }

  Widget line(Color color) {
    return Container(
            margin: const EdgeInsets.only(bottom: 20),
            color: color,
            height: 2,
            width: MediaQuery.of(context).size.width,
          );
  }

  Widget responsiveText(String text, double fontSizeP, Color color,){
  return LayoutBuilder(
    builder: (BuildContext context, BoxConstraints constraints){
      double fontSizepi = MediaQuery.of(context).size.width * fontSizeP;
      return Text(
            text,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: fontSizepi,
        ));
    },);
  }

  void addTodo(String todoText){
    setState(() {
      todoList.add(todo(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        text: todoText));
    });

    todoControllerAddtasks.clear();
  }

  void checkboxFunction(todo checkboxDone){
    setState(() {
      checkboxDone.done = !checkboxDone.done; });
  }

  //function for delete
  void deleteFunction(String id){
    setState(() {
      todoList.removeWhere((element) => element.id == id);});
  }

} 