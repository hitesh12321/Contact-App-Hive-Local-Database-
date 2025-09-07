// ignore_for_file: non_constant_identifier_names

import 'package:contacts/UIHelper/CustomWidgets.dart';

import 'package:contacts/services/contactDetail.dart';
import 'package:flutter/material.dart';

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

  List<Map<String, String>> contactsInfo = [
    {'name': "Aman", 'phone': "6395429223"},
    {'name': "Saurabh", 'phone': "6395429223"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contacts")),
      body: ListView.builder(
        itemCount: contactsInfo.length,
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
                    name: contactsInfo[index]['name']!,
                    phone: contactsInfo[index]['phone']!,
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
                      contactsInfo[index]['name']!,
                      contactsInfo[index]['phone']!,

                      context,
                    );
                  });
                },
                // onPressing Delete
                () {
                  Navigator.pop(context);
                  setState(() {
                    contactsInfo.removeAt(index);
                  });
                },
              );
            },

            title: Text(contactsInfo[index]['name']!),
            subtitle: Text(contactsInfo[index]['phone']!),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      drawer: Drawer(semanticLabel: "HELP"),
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
                contactsInfo.add({
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
          TextButton(onPressed: () {}, child: Text("Cancel")),

          TextButton(
            onPressed: () {
              setState(() {
                contactsInfo[index] = {
                  'name': EditnameController.text,
                  'phone': EditphoneController.text,
                };
                Navigator.pop(context);
              });
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


//  contactsInfo.insert(index, {
//                     'name': EditnameController.text,
//                     'phone': EditphoneController.text,
//                   });

//contactsInfo.insert(index, {'name': '', 'phone': ''});



  // bool _validatePhoneNumber(String phoneNumber) {
  //   // E.164 format: + followed by country code and number
  //   final regex = RegExp(r'^\+[1-9]\d{1,14}$');

  //   if (phoneNumber.isEmpty) {
  //     Uihelper.customShowDialog(context, "Please enter a phone number");
  //     return false;
  //   }

  //   if (!regex.hasMatch(phoneNumber)) {
  //     Uihelper.customShowDialog(
  //       context,
  //       "Please enter a valid phone number with country code\nExample: +919876543210",
  //     );
  //     return false;
  //   }

  //   return true;
  // }