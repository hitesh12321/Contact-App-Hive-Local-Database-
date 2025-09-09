import 'package:hive_flutter/hive_flutter.dart';

class contactDataBase {
  List<Map<String, dynamic>> contactList = [];
  late Box _mybox;

  void initialContactList() {
    // Only initialize if not already done
    contactList = [
      {"name": "Sample", "phone": "1234567890"},
    ];

    print("Default contacts initialized for the first time");
  }

  void loadData() {
    final data = _mybox.get("contactList");
    if (data is List) {
      contactList = List<Map<String, dynamic>>.from(
        data.map((item) => Map<String, dynamic>.from(item)),
      );
    }
  }

  Future<void> InitializeBox() async {
    try {
      _mybox = await Hive.openBox("contactBox");

      // Debug print
      print("Box opened successfully");

      if (_mybox.get("contactList") == null) {
        initialContactList(); // Set default contacts
        updateContactList(); // Save to Hive ONLY first time
      } else {
        loadData();
      }

      print("Final contact list: $contactList");
    } catch (e) {
      print("Error in InitializeBox: $e");
      // Emergency fallback
      contactList = [];
    }
  }

  // Update contact list in Hive
  void updateContactList() {
    try {
      _mybox.put("contactList", contactList);
      print("Data saved to Hive: $contactList");
    } catch (e) {
      print("Error saving to Hive: $e");
    }
  }

  // Add contact and save to Hive
  void addContact(Map<String, dynamic> contact) {
    contactList.add(contact);
    updateContactList();
  }

  // when edit is used
  // Update contact and save to Hive
  void updateContact(int index, Map<String, dynamic> contact) {
    contactList[index] = contact;
    updateContactList();
  }

  // Delete contact and save to Hive
  void deleteContact(int index) {
    contactList.removeAt(index);
    updateContactList();
  }
}
