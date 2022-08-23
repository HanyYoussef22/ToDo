import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Models/task_model.dart';
import 'package:todo/shard/components/components.dart';
import 'package:todo/shard/providers/app_provider.dart';
import 'package:todo/shard/styles/clors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo/utils/firbase%20firestore.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime SelectData = DateTime.now();
  var formKey = GlobalKey<FormState>();
  String title = '';
  String desc = '';

  Widget build(BuildContext context) {
    var provider =Provider.of<AppProvider>(context);
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            color: provider.themeMode==ThemeMode.dark?SecendColor:WhiteColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(AppLocalizations.of(context)!.addTask,
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontSize: 22, fontWeight: FontWeight.w600,color:provider.themeMode==ThemeMode.light?GreyColor:WhiteColor),
                  textAlign: TextAlign.center),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      onChanged: (titl) {
                        title = titl;
                      },
                      decoration: InputDecoration(

                        label: Text(AppLocalizations.of(context)!.titel),
                        labelStyle: TextStyle(color: PrimaryColor),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: PrimaryColor
                            )
                        ),
                      ),

                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return AppLocalizations.of(context)!.pleaseentertasktitle;
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      onChanged: (titl) {
                        desc = titl;
                      },
                      minLines: 4,
                      maxLines: 4,
                      decoration: InputDecoration(
                        label: Text(AppLocalizations.of(context)!.description),
                        labelStyle: TextStyle(color: PrimaryColor),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: PrimaryColor
                            )
                        ),
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return AppLocalizations.of(context)!.pleaseentertaskdescription;
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
                          .copyWith(fontSize: 22,color: provider.themeMode==ThemeMode.light?GreyColor:WhiteColor,
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    InkWell(
                        onTap: () {
                          OpenDataPiker();
                        },
                        child: Text(
                            '${SelectData.year}/${SelectData.month}/${SelectData.day}',
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(color: provider.themeMode==ThemeMode.light?GreyColor:WhiteColor, fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center)),
                    SizedBox(
                      height: 12,
                    ),
                    ElevatedButton(

                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            TaskModel task = TaskModel(
                                title: title,
                                description: desc,
                                selectData: DateUtils.dateOnly(SelectData).microsecondsSinceEpoch);
                            AddtaskToFirestore(task).then((value) {
                              showMessage(context,AppLocalizations.of(context)!.successfullyadded,AppLocalizations.of(context)!.ok
                                  , () {
                                    hideBottomSheet(context);
                                    hideBottomSheet(context);
                                  });
                              print('Adding Successfully');
                            }).catchError((e) {
                              print(e);
                            });
                          }
                        },
                        style:   ElevatedButton.styleFrom(
                            primary: provider.themeMode==ThemeMode.light?PrimaryColor:mainBackgroundColorDark,)
                        ,child: Text(AppLocalizations.of(context)!.addTask,style: Theme.of(context).textTheme.headline2!.copyWith(color: provider.themeMode==ThemeMode.light?WhiteColor:const Color(0xffC8C9CB),
                        ),))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  OpenDataPiker() async {
    var ChosenData = await showDatePicker(
        context: context,
        initialDate: SelectData,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));

    if (ChosenData != null) {
      SelectData = ChosenData;
      setState(() {});
    }
  }
}
