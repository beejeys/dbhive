

import 'package:dbhive_sample/db/functions/db_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:dbhive_sample/db/model/data_model.dart';
import 'package:dbhive_sample/db/functions/db_functions.dart';

class ListStudent extends StatelessWidget {
  const ListStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder:(BuildContext ctx, List<StudentModel> studentList, Widget? child) {

        return ListView.separated(
          itemBuilder: (ctx, index) {
            final data = studentList[index];
            return ListTile(
              title:Text(data.name),
              subtitle: Text(data.age),
            );
          }, 
          separatorBuilder: (ctx,index) {
            return const Divider();
          }, 
          itemCount: studentList.length
        );

      },
       
    );
  }
}