import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/shard/providers/app_provider.dart';
import 'package:todo/shard/styles/clors.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../Models/task_model.dart';
import '../../../utils/firbase firestore.dart';

class TaskItem extends StatelessWidget {
  TaskModel taskModel;

  TaskItem(this.taskModel);

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppProvider>(context);
    var size = MediaQuery.of(context).size;
    return Slidable(
      startActionPane: ActionPane(
        extentRatio: 0.30,
        motion: StretchMotion(),
        children: [

          SlidableAction(
            onPressed: (context) {
              DeletTaskFromFireStore(taskModel);
            },
            icon: Icons.delete,
            backgroundColor: Theme.of(context).colorScheme.error,
            label: 'Delete',
            borderRadius: BorderRadius.circular(20) ,
            autoClose: true,
          )
        ],
      ),
      child: Container(
        height: size.height * .110
        ,
        margin: EdgeInsets.all(12),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: provider.themeMode==ThemeMode.light?WhiteColor:SecendColor),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 3,
              color: PrimaryColor,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    '${taskModel.title}',
                    style: Theme.of(context).textTheme.headline2!.copyWith(color: provider.themeMode==ThemeMode.light?Colors.black:WhiteColor),
                  ),
                  Text(
                    '${taskModel.description}',
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: Colors.blue),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: PrimaryColor,
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Icon(
                Icons.check,
                size: 30,
                color: WhiteColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
