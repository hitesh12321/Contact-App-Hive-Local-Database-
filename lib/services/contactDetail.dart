// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactDetail extends StatelessWidget {
  String name;
  String phone;
  ContactDetail({super.key, required this.name, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contact Detail")),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          child: Card(
            elevation: 2,
            shadowColor: Colors.black,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,

              children: [
                Icon(Icons.person_2, size: 170, color: Colors.grey),
                const SizedBox(height: 30),
                Text(
                  name,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    phone,
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                SizedBox(height: 150),

                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    child: Text(
                      "BACK",
                      style: GoogleFonts.poppins(fontSize: 20),
                    ),
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                //   children: [
                //     ElevatedButton.icon(
                //       icon: Icon(Icons.delete_forever_outlined),
                //       onPressed: () {

                //       },
                //       label: Text('D E L E T E'),
                //     ),

                //     ElevatedButton.icon(
                //       icon: Icon(Icons.delete_forever_outlined),
                //       onPressed: () {},
                //       label: Text('D E L E T E'),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
