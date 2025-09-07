// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

// class Customwidgets extends StatelessWidget {
//   BuildContext context;
//   String message;
//   VoidCallback Edit;
//   VoidCallback Delete;
//   const Customwidgets({super.key , required this.context, required this.message, required this.Edit, required this.Delete});

//   @override
//   Widget build(BuildContext context) {
//     return ;
//   }
// }

class Customwidgets {
  static showCustomDialog(
    BuildContext context,
    String message,
    VoidCallback Edit,
    VoidCallback Delete,
  ) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("ACTIONS", style: TextStyle(fontWeight: FontWeight.bold)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(onPressed: Edit, label: Text('EDIT')),
                TextButton.icon(onPressed: Delete, label: Text('DELETE')),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
