import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/Models/task_model.dart';

CollectionReference<TaskModel> getDataFromFirebase(){
  return FirebaseFirestore.instance.collection('task').withConverter<TaskModel>(
    fromFirestore:(snapshot,_){
      return TaskModel.fromJson(snapshot.data()!);
    },
    toFirestore: (task,_)=>task.toJson(),
  );
}

Future AddtaskToFirestore(TaskModel task){
  var collection=getDataFromFirebase();
  var doc =collection.doc();
  task.id= doc.id;
  return doc.set(task);
  //todo
  // collection.add(task);
}