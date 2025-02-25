import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/bloc/task/task_bloc.dart';
import 'package:todo/presentation/widgets/text_widget.dart';

deleteConfirmAlertDialog(BuildContext context, int id) {
   showDialog(
      context: context,
      builder: (BuildContext context) {
  return AlertDialog(
    title: const Text('Delete Confirmation'),
    content:  TextWidget(text:'Are you sure you want to delete this Task?'),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          context.pop(); // Close the dialog
        },
        child: const Text('Cancel'),
      ),
      TextButton(
        onPressed: () {
          context
              .read<TaskBloc>()
              .add(DeleteTask(id: id)); // Call the delete function
          Navigator.of(context).pop(); // Close the dialog
        },
        child: const Text('Delete'),
      ),
    ],
  );
      });
}
