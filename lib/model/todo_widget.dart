import 'package:flutter/material.dart';
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
      height: 30,
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
      )
    );
  }
}