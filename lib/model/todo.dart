// ignore: camel_case_types
class todo{
  String? id;
  String text;
  bool done = false;

  todo({
    required this.id,
    required this.text,
    this.done = false,
  });

  static List<todo>todoList(){return [];}
  static List<todo>delatedTodoList(){return [];}
}