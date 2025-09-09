// ignore_for_file: non_constant_identifier_names

import 'package:contacts/DataBase/HiveDataBase.dart';
import 'package:contacts/UIHelper/CustomWidgets.dart';

import 'package:contacts/services/contactDetail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController editNameController = TextEditingController();
  TextEditingController editPhoneController = TextEditingController();

  final db = contactDataBase();
  bool isLoading = true;

  void InitializeApp() async {
    await db.InitializeBox();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    InitializeApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contacts",

          style: GoogleFonts.yaldevi(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: db.contactList.length,
              padding: EdgeInsets.all(10),
              shrinkWrap: true,
              itemBuilder: (context, index) => Card(
                elevation: 2,
                shadowColor: Colors.black,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: Icon(Icons.person),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContactDetail(
                          name: db.contactList[index]['name']!,
                          phone: db.contactList[index]['phone']!,
                        ),
                      ),
                    );
                  },
                  onLongPress: () {
                    Customwidgets.showCustomDialog(
                      context,
                      "",
                      () {
                        //onpressing Edit
                        Navigator.pop(context);
                        setState(() {
                          onEditContactPressed(
                            index,
                            db.contactList[index]['name']!,
                            db.contactList[index]['phone']!,

                            context,
                          );
                        });
                      },
                      // onPressing Delete
                      () {
                        Navigator.pop(context);
                        setState(() {
                          db.deleteContact(index);
                        });
                      },
                    );
                  },

                  title: Text(db.contactList[index]['name']!),
                  subtitle: Text(db.contactList[index]['phone']!),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          onFlotingActionButtonPressed(
            context,
            nameController,
            phoneController,
          );
        },
        child: Icon(Icons.add, size: 40),
      ),
    );
  }

  // create new contact by floating button
  onFlotingActionButtonPressed(
    BuildContext context,
    TextEditingController nameController,
    TextEditingController phoneController,
  ) {
    nameController.clear();
    phoneController.clear();
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Create New Contact"),
        content: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            TextField(
              controller: nameController,

              decoration: InputDecoration(
                hintText: "Enter Contact Name",
                icon: Icon(Icons.person_2_outlined),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: phoneController,

              decoration: InputDecoration(
                hintText: "Enter Phone No.",
                icon: Icon(Icons.call),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel"),
          ),

          TextButton(
            onPressed: () {
              setState(() {
                db.addContact({
                  'name': nameController.text,
                  'phone': phoneController.text,
                });
              });

              Navigator.pop(context);
            },
            child: Text("Save"),
          ),
        ],
      ),
    );
  }

  /// for Edit Contact
  onEditContactPressed(
    int index,
    String currentName,
    String currentPhoneno,
    BuildContext context,
  ) {
    TextEditingController EditnameController = TextEditingController(
      text: currentName,
    );
    TextEditingController EditphoneController = TextEditingController(
      text: currentPhoneno,
    );

    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("Edit  Contact"),
        content: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            TextField(
              controller: EditnameController,

              decoration: InputDecoration(
                hintText: currentName,
                icon: Icon(Icons.person_2_outlined),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: EditphoneController,

              decoration: InputDecoration(
                hintText: currentPhoneno,
                icon: Icon(Icons.call),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel"),
          ),

          TextButton(
            onPressed: () {
              setState(() {
                db.updateContact(index, {
                  'name': EditnameController.text,
                  'phone': EditphoneController.text,
                });
              });
              Navigator.pop(context);
            },
            child: Text("Save Changes"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
