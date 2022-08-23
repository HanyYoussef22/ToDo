class TaskModel{
  String id;
  String title;
  String description;
  int selectData;
  bool isDone;
  TaskModel({this.id='',
    required this.title,
    required this.description,
   required this.selectData,
    this.isDone=false
});
  TaskModel.fromJson(Map<String,dynamic>Json):this(
    id: Json['id']! as String,
    title: Json['title']! as String,
    description: Json['description']! as String,
    selectData: Json['selectData']! as int,
    isDone: Json['isDone']! as bool,
  );

  Map<String,dynamic>toJson(){
    return{
      'id':id,
      'title':title,
      'description':description,
      'selectData':selectData,
      'isDone':isDone
    };
  }
}