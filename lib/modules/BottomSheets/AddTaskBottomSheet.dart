import 'package:flutter/material.dart';
import 'package:todo/shard/styles/clors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var SelectData=DateTime.now();
  var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
        decoration: BoxDecoration(
          color: WhiteColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                AppLocalizations.of(context)!.addTask,
                style:
                    Theme.of(context).textTheme.headline2!.copyWith(fontSize: 22,fontWeight: FontWeight.bold),
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text(AppLocalizations.of(context)!.titel),
                      ),
                      validator:(text){
                        if(text==null||text.isEmpty){
                          return 'Pleas Enter Titel';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      minLines: 4,
                      maxLines: 4,
                      decoration: InputDecoration(
                        label: Text(AppLocalizations.of(context)!.description),
                      ),
                      validator:(text){
                        if(text==null||text.isEmpty){
                          return 'Pleas Enter Description';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      AppLocalizations.of(context)!.select,
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontSize: 22,fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: (){
                        OpenDataPiker();
                      },
                      child: Text(
                        '${SelectData.year}/${SelectData.month}/${SelectData.day}',
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(fontSize: 22)
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(onPressed: (){
                      if(formKey.currentState!.validate()){

                      }
                    }, child:Text('add') )

                  ],
                ),
              ),
            ],
          ),
        ),
    ),
      );
  }
  OpenDataPiker()async{
    var ChosenData =await showDatePicker(context: context,
        initialDate: SelectData,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365))
    );

    if(ChosenData !=null){
      SelectData=ChosenData;
      setState(() {
      });
    }
  }
}
