// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ContactDetail extends StatelessWidget {
  String name;
  String phone;
  ContactDetail({super.key, required this.name, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contact Detail")),
      body: Card(
        elevation: 2,
        shadowColor: Colors.black,
        color: const Color.fromARGB(255, 250, 217, 217),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            Icon(Icons.person_2, size: 170, color: Colors.grey),
            Container(
              height: 30,
              width: 100,
              color: Colors.amber,

              child: Text("CONTACT NAME : $name"),
            ),
            Card(child: Text("CONTACT PHONE : $phone")),
            SizedBox(height: 150),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.edit),
                  onPressed: () {},
                  label: Text("Edit   "),
                ),
                ElevatedButton.icon(
                  icon: Icon(Icons.delete),
                  onPressed: () {},
                  label: Text("Delete  "),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
