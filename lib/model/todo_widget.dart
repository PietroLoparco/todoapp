import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todoapp/model/todo.dart';

class TodoWidget extends StatelessWidget {
  final todo todos;
  // ignore: prefer_typing_uninitialized_variables
  final checkboxChange;
  // ignore: prefer_typing_uninitialized_variables
  final deleteTask;

  const TodoWidget({Key? key, required this.todos,required this.checkboxChange,required this.deleteTask,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only( left: 30, right: 30, bottom: 20,),
      width: MediaQuery.of(context).size.width,
      //height: MediaQuery.of(context).size.height * 0.05,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(12, 38, 70, 1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color.fromRGBO(42, 38, 48, 1),
        ),
        boxShadow: const [
           BoxShadow(
             spreadRadius: 0,
             offset: Offset(0, 0),
             blurRadius: 10,
           ),
        ]
      ),
      child: ListTile(
          onTap: (){
            checkboxChange(todos);
          },
            
          leading: Icon(
              !todos.done? CupertinoIcons.square: CupertinoIcons.checkmark_square,
              color:const Color.fromARGB(255, 148, 148, 148),
            ),

        title: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints){
          double fontSizepi = MediaQuery.of(context).size.width * 0.04;
          return Text(
            todos.text,
            style: TextStyle(
              color: const Color.fromARGB(255, 148, 148, 148),
              decoration: todos.done ? TextDecoration.lineThrough : null,
              decorationColor: Colors.amber,
              decorationThickness: 2.85,
              fontSize: fontSizepi,
            )
          );
        },
      ),

      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {Clipboard.setData(ClipboardData(text: todos.text));},
            icon: const Icon(CupertinoIcons.doc_on_clipboard, color:Color.fromARGB(255, 148, 148, 148),),
          ),
          IconButton(
            onPressed: () {deleteTask(todos.id, todos.text);},
            icon: const Icon(CupertinoIcons.delete, color:Color.fromARGB(255, 148, 148, 148),),
          ),
        ],
      ),
      ),
    );
  }
}