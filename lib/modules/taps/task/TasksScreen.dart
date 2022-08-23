import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter_date_picker_timeline/flutter_date_picker_timeline.dart';
import 'package:horizontalcalender/horizontalcalendar.dart';
import 'package:provider/provider.dart';
import 'package:todo/Models/task_model.dart';
import 'package:todo/modules/taps/task/taskItem.dart';
import 'package:todo/shard/providers/app_provider.dart';
import 'package:todo/shard/styles/clors.dart';
import 'package:calender_picker/calender_picker.dart';
import 'package:todo/shard/styles/clors.dart';
import '../../../shard/styles/clors.dart';
import '../../../utils/firbase firestore.dart';


class TasksScreen extends StatefulWidget {
  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  var selectedDate=DateTime.now();
  // var selectedDate2=DateTime.now();


 //  bool value=true;
 //  bool isTrue=true;
 // int count=0;

   // DateTime Value=DateTime.now().month.bitLength;
  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<AppProvider>(context);
    return
      Container(
        child:
        Column(
          children: [
            CalendarTimeline(
                initialDate: selectedDate,
                firstDate: DateTime.now().subtract(Duration(days: 365)),
                lastDate: DateTime.now().add(Duration(days: 365)),
                onDateSelected: (date) {
                  selectedDate = date;

                  setState(() {});
                },
                leftMargin: 20,
                monthColor: provider.themeMode==ThemeMode.light? Colors.black:WhiteColor,
                dayColor: provider.themeMode==ThemeMode.light? Colors.black:WhiteColor,
                activeDayColor: provider.themeMode==ThemeMode.dark? WhiteColor:PrimaryColor,
                activeBackgroundDayColor: provider.themeMode==ThemeMode.light?WhiteColor: PrimaryColor,
                dotsColor: provider.themeMode==ThemeMode.light? PrimaryColor:Colors.black,
                selectableDayPredicate: (date) => true,
                locale: 'en_ISO',
              ),



            // Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     CalenderPicker(
            //       // firstDate: DateTime(2019, 1, 15),
            //       // lastDate: DateTime(2020, 11, 20),
            //       DateTime.now(),
            //       initialSelectedDate: DateTime.now(),
            //       selectionColor: Colors.black,
            //       selectedTextColor: Colors.white,
            //       onDateChange: (date) {
            //         // New date selected
            //         setState(() {
            //           selectedDate = date;
            //         });
            //       },
            //     ),
            //   ],
            // )
            //last Used
            // CalendarTimeline(
            //   initialDate: selectedDate,
            //   firstDate: DateTime.now().subtract(Duration(days: 365)),
            //   lastDate: DateTime.now().add(Duration(days: 365)),
            //   onDateSelected: (date) {
            //     selectedDate = date;
            //     setState(() {});
            //   },
            //   leftMargin: 20,
            //   monthColor: Colors.black,
            //   dayColor: Colors.black,
            //   activeDayColor: PrimaryColor,
            //   activeBackgroundDayColor: WhiteColor,
            //   dotsColor: PrimaryColor,
            //   selectableDayPredicate: (date) => true,
            //   locale: 'en_ISO',
            // )
            // ,

            // SizedBox(
            //   height: 10,
            // ),
            // FlutterDatePickerTimeline(
            //   itemHeight: 70,
            //   selectedItemBackgroundColor: WhiteColor,
            //   // unselectedItemBackgroundColor:Colors. ,
            //   unselectedItemTextStyle:TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
            //   unselectedItemBackgroundColor:Colors.transparent,
            //   selectedItemTextStyle:TextStyle(color: PrimaryColor,fontSize: 20),
            //   selectedItemWidth: 200,
            //   unselectedItemWidth:39,
            //   selectedItemMargin:EdgeInsets.only(left:8 ,right:8 ),
            //   itemRadius: 15,
            //   startDate: DateTime.now().subtract(Duration(days: 365)),
            //   endDate: DateTime.now().add(Duration(days: 365)),
            //   initialSelectedDate: DateTime.now(),
            //   onSelectedDateChange: (time) {
            //     selectedDate=time!;
            //     // print('Day ${DateTimey}');
            //   },
            // )
             SizedBox(
              height: 10,
            ),
            Expanded(
              child:
              StreamBuilder<QuerySnapshot<TaskModel>>(
                stream: GetTaskFromFireStoreUsingStream(selectedDate),
                builder: (context,snapshot){
                  if(snapshot.connectionState==ConnectionState.waiting){
                   return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Text('something went wrong');
                  }

                    List task= snapshot.data!.docs.map((e) => e.data()).toList();
                    return ListView.builder(itemBuilder: (context,index){
                      return TaskItem(task[index]);
                    },
                      itemCount: task.length,);


                },

              )



            ),


          ],
        ),

      );
  }
}
// List task= snapshot.data!.docs.map((e) => e.data()).toList();
// return ListView.builder(itemBuilder: (context,index){
// return TaskItem(task[index]);
// },
// itemCount: task.length,);
// StreamBuilder<QuerySnapshot<TaskModel>>(
// stream: GetTaskFromFireStoreUsingStream2(),
// builder: (context,snapshot){
// if(snapshot.connectionState==ConnectionState.waiting){
// return Center(child: CircularProgressIndicator());
// }
// if (snapshot.hasError) {
// return Text('something went wrong');
// }
//
// List task= snapshot.data!.docs.map((e) => e.data()).toList();
// return ListView.builder(itemBuilder: (context,index){
// return TaskItem(task[index]);
// },
// itemCount: task.length,);
//
//
// },
//
// )

// Row(
// children: [
// IconButton(onPressed: (){
// count++;
// if(count%2==0){
// value=true;
// }else{
// value=false;
// }
// setState(() {
//
// });
//
// }, icon: Icon(Icons.sort, color: value?GreenColor :GreyColor,))
// ],
// ),