import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo/modules/BottomSheets/AddTaskBottomSheet.dart';
import 'package:todo/modules/taps/task/setting/SettingScreen.dart';
import 'package:todo/modules/taps/task/TasksScreen.dart';
import 'package:todo/shard/providers/app_provider.dart';

import '../shard/styles/clors.dart';


class HomeLayout extends StatefulWidget {
static const String roudeName='Home';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  var provider;
int currentIndex=0;
List<Widget>taps=[TasksScreen(),SettingScreen()];
  @override
  Widget build(BuildContext context) {
     provider=Provider.of<AppProvider>(context);
    return Scaffold(
      backgroundColor:provider.themeMode==ThemeMode.light ? mainBackgroundColor:mainBackgroundColorDark,

      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.todolist,
          style: TextStyle(fontSize: 22),),
      ),
      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(
          side: BorderSide(
            color: provider.themeMode==ThemeMode.dark?SecendColor:WhiteColor,
            width: 4
          )
        ),
        onPressed: (){
          OpenBottomSheetToAddTask();
        },
        child: Icon(Icons.add),
      ),floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked ,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        shape: CircularNotchedRectangle(),
        color: provider.themeMode==ThemeMode.dark?SecendColor:WhiteColor,
        child: BottomNavigationBar(
            onTap: (index){
            currentIndex=index;
            setState((){});
          },backgroundColor:Colors.transparent,
          elevation: 0.0,
          currentIndex: currentIndex,
          items: [

            BottomNavigationBarItem(icon: Icon(Icons.list),label: AppLocalizations.of(context)!.list),
            BottomNavigationBarItem(icon: Icon(Icons.settings),label: AppLocalizations.of(context)!.setting)

          ],
        ),
      ) ,
      body: taps[currentIndex],
    );
  }
  OpenBottomSheetToAddTask(){
    showModalBottomSheet(context: context, builder: (context){
     return Container(
         color: provider.themeMode==ThemeMode.dark?SecendColor:WhiteColor,
       child: Padding(

         padding: EdgeInsets.only(
           bottom: MediaQuery.of(context).viewInsets.bottom,
         ),
         child: AddTaskBottomSheet(),
       )
     );

  },
      isScrollControlled: true,
  );
  }
}
