import 'package:flutter/material.dart';
import 'package:todo/shard/styles/clors.dart';

class TaskItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return
      Container(
        height: size.height*.10,
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: WhiteColor
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 3,
            color: PrimaryColor,
          ),
          Expanded(
            child: Column(
              children: [
                Text('Titel',style: Theme.of(context).textTheme.headline2,),
                Text('Description',style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.blue),)

              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: PrimaryColor,
            ),
            padding: EdgeInsets.symmetric(horizontal: 24,vertical: 8),
            child: Icon(Icons.check,size: 35,color: WhiteColor,),
          )
        ],
      ),
    );
  }
}
