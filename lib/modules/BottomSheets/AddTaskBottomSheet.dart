import 'package:flutter/material.dart';
import 'package:todo/shard/styles/clors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddTaskBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text(AppLocalizations.of(context)!.titel),
                    ),
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
                  Text(
                    '22/5/2022',
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontSize: 22)
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(onPressed: (){}, child:Text('') )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
