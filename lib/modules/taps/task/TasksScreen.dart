import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter_date_picker_timeline/flutter_date_picker_timeline.dart';
import 'package:todo/modules/taps/task/taskItem.dart';
import 'package:todo/shard/styles/clors.dart';


class TasksScreen extends StatelessWidget {
   // DateTime Value=DateTime.now().month.bitLength;
  @override
  Widget build(BuildContext context) {
    return
      Container(
        child: Column(
          children: [
            // Text('$Value',style:TextStyle(fontSize: 30,),textAlign: TextAlign.center,),
            // CalendarTimeline(
            //   initialDate: DateTime(2020, 4, 20),
            //   firstDate: DateTime(2019, 1, 15),
            //   lastDate: DateTime(2020, 11, 20),
            //   onDateSelected: (date) => print(date),
            //   leftMargin: 20,
            //   monthColor: Colors.blueGrey,
            //   dayColor: Colors.teal[200],
            //   activeDayColor: Colors.white,
            //   activeBackgroundDayColor: Colors.redAccent[100],
            //   dotsColor: Color(0xFF333A47),
            //   selectableDayPredicate: (date) => date.day != 23,
            //   // locale: '',
            // ),
            SizedBox(
              height: 10,
            ),
            FlutterDatePickerTimeline(
              itemHeight: 70,
              selectedItemBackgroundColor: WhiteColor,
              // unselectedItemBackgroundColor:Colors. ,
              unselectedItemTextStyle:TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
              unselectedItemBackgroundColor:Colors.transparent,
              selectedItemTextStyle:TextStyle(color: PrimaryColor,fontSize: 20),
              selectedItemWidth: 200,
              unselectedItemWidth:39,
              selectedItemMargin:EdgeInsets.only(left:8 ,right:8 ),
              itemRadius: 15,
              startDate: DateTime.now().subtract(Duration(days: 365)),
              endDate: DateTime.now().add(Duration(days: 365)),
              initialSelectedDate: DateTime.now(),
              onSelectedDateChange: (DateTime) {
                // Value.month;
                print('Day ${DateTime?.day}');
              },
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(itemBuilder: (context,index){
                return TaskItem();
              },
                itemCount: 12,),
            )
          ],
        ),

      );
  }
}
