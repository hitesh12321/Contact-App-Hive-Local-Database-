// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

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
