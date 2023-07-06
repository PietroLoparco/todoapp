import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoapp/model/todo.dart';
import 'auth.dart';

class Database{
 final FirebaseDatabase database = FirebaseDatabase.instance;
 final uid = Auth().currentUser?.uid;

 CollectionReference todoCompleted = FirebaseFirestore.instance.collection('todoCompleted');
 CollectionReference todoUncompleted = FirebaseFirestore.instance.collection('todoUncompleted');

  Future<void> createID() async{
    await todoUncompleted.doc(uid).set({'id' : 'text'});
    await todoCompleted.doc(uid).set({'id' : 'text'});
    removeDataUncompleted('id');
    removeDataCompleted('id');
  }

  Future<void> updateDataUncompleted(id, todoTetxt) async{
  removeDataCompleted(id);
  await todoUncompleted.doc(uid)
    .update({
      '$id' : todoTetxt
    });
  }

  Future<void> updateDataCompleted(id, todoTetxt) async{
  removeDataUncompleted(id);
  await todoCompleted.doc(uid)
  .update({
      '$id' : todoTetxt
    });
  }

  Future<void> removeDataUncompleted(id) async{
    await todoUncompleted.doc(uid).update({'$id' : FieldValue.delete()}); 
  }

  Future<void> removeDataCompleted(id) async{
    await todoCompleted.doc(uid).update({'$id' : FieldValue.delete()}); 
  }

  Future<void> getData() async {
    
    String documentId = uid!;
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
      await FirebaseFirestore.instance.collection('todoUncompleted').doc(documentId).get();
    
    var data = documentSnapshot.data().toString();
    
    List<String> values = data.split(RegExp(r'[,|:]'));
    
    for(int i = 0; i < values.length; i += 2){
      int j = i+1;
      todo.todoList().add(todo(id: values[i], text: values[j]));
      print(values[i]);
    }
  }
}

//TODO: provare a inserire la funzione o almeno la parte del for in home_page