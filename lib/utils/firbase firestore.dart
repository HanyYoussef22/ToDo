import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/Models/task_model.dart';

CollectionReference<TaskModel> getDataFromFirebase(){
  return FirebaseFirestore.instance.collection('task').withConverter<TaskModel>(
    fromFirestore:(snapshot,_){
      return TaskModel.fromJson(snapshot.data()!);
    },
    toFirestore: (task,_)=>task.toJson(),
  );
}
Future<void> DeletTaskFromFireStore (TaskModel task)async {
  var collection = await getDataFromFirebase();
  collection.doc(task.id).delete();
}
// Future<void> UpdateTaskFromFireStore(TaskModel task)async{
//   var collection = await getDataFromFirebase();
//   collection.doc(task.id).update();
// }

Future AddtaskToFirestore(TaskModel task){
  var collection=getDataFromFirebase();
  var doc =collection.doc();
  task.id= doc.id;
  return doc.set(task);
  //todo
  // collection.add(task);
}
Future<QuerySnapshot<TaskModel>>GetTaskFromFireStore()async{
  var collection = getDataFromFirebase();
  return collection.get();
}
Stream<QuerySnapshot<TaskModel>> GetTaskFromFireStoreUsingStream(DateTime time){
  var collection =getDataFromFirebase();
  return collection.where('selectData',isEqualTo: DateUtils.dateOnly(time).microsecondsSinceEpoch).snapshots();
}
// Stream<QuerySnapshot<TaskModel>> GetTaskFromFireStoreUsingStream2(){
//   var collection =getDataFromFirebase();
//   return collection..doc('task').snapshots();
// }

