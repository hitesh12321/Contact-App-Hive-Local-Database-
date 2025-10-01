📱 Contacts App
A simple and elegant Flutter contacts management application with local data persistence using Hive database.

📋 Overview
The Contacts App allows users to:

📝 Create new contacts with name and phone number

👀 View contact details

✏️ Edit existing contacts

🗑️ Delete contacts

💾 Store data locally using Hive

🛠️ Tech Stack
Framework: Flutter

Database: Hive (Lightweight & fast NoSQL database)

State Management: Built-in Flutter StatefulWidget

UI: Material Design Components

📁 Project Structure
text
contacts/
├── lib/
│   ├── main.dart                 # App entry point
│   ├── homepage.dart            # Main contacts list screen
│   ├── services/
│   │   └── contactDetail.dart   # Contact details screen
│   ├── DataBase/
│   │   └── HiveDataBase.dart    # Database operations
│   └── UIHelper/
│       └── CustomWidgets.dart   # Reusable UI components
🚀 Features
Homepage (homepage.dart)
Display all contacts in a scrollable list

Add new contacts via floating action button

Long press on contacts for edit/delete options

Navigate to contact details on tap

Contact Details (contactDetail.dart)
View individual contact information

Clean and focused contact display

Database (HiveDataBase.dart)
Local data persistence using Hive

CRUD operations (Create, Read, Update, Delete)

Automatic data initialization with sample contact

Custom Widgets (CustomWidgets.dart)
Reusable dialog for contact actions

Consistent UI across the app

🎨 UI/UX Features
Material Design: Follows Material Design guidelines

Google Fonts: Uses Poppins and Yaldevi fonts for better typography

Responsive Layout: Adapts to different screen sizes

Interactive Elements:

Card-based contact list

Clear action buttons

Intuitive navigation

📦 Dependencies
Add these to your pubspec.yaml:

yaml
dependencies:
  flutter:
    sdk: flutter
  hive_flutter: ^[latest_version]
  google_fonts: ^[latest_version]
🔧 Installation & Setup
Clone the repository

bash
git clone https://github.com/your-username/contacts-app.git
cd contacts-app
Install dependencies

bash
flutter pub get
Run the application

bash
flutter run
🗃️ Database Schema
Each contact is stored as a Map with the following structure:

dart
{
  'name': 'Contact Name',
  'phone': 'Phone Number'
}
🔄 Core Operations
Adding a Contact
Tap the floating action button (+)

Enter name and phone number

Tap "Save"

Editing a Contact
Long press on a contact

Select "EDIT" from the dialog

Modify the details

Tap "Save Changes"

Deleting a Contact
Long press on a contact

Select "DELETE" from the dialog

Viewing Contact Details
Tap on any contact to view detailed information

🎯 Key Components
Homepage Class
Main screen displaying all contacts

Handles contact operations

Manages application state

contactDataBase Class
Database initialization

CRUD operations

Data persistence management

Customwidgets Class
Reusable dialog component

Consistent action presentation

🔍 Code Highlights
Database Initialization
dart
void InitializeBox() async {
  _mybox = await Hive.openBox("contactBox");
  // Loads existing data or initializes with sample contact
}
Contact Operations
dart
void addContact(Map<String, dynamic> contact);
void updateContact(int index, Map<String, dynamic> contact);
void deleteContact(int index);
📱 Screens
Contacts List: Main screen with all contacts

Contact Details: Individual contact view

Add/Edit Dialog: Modal for creating/editing contacts

Action Dialog: Context menu for contact actions

🚀 Getting Started for Developers
Prerequisites
Flutter SDK

Dart

Android Studio/VSCode with Flutter extension

Building from Source
Ensure Flutter is installed and configured

Clone the repository

Run flutter pub get to install dependencies

Use flutter run to start the application

🤝 Contributing
Fork the project

Create your feature branch (git checkout -b feature/AmazingFeature)

Commit your changes (git commit -m 'Add some AmazingFeature')

Push to the branch (git push origin feature/AmazingFeature)

Open a Pull Request

📄 License
This project is licensed under the MIT License - see the LICENSE file for details.

🐛 Troubleshooting
Common Issues
Hive initialization errors: Ensure Hive is properly initialized in main.dart

Box not opening: Check if Hive is initialized before opening boxes

Data not persisting: Verify updateContactList() is called after operations

Debugging Tips
Check console for Hive initialization messages

Verify contact list updates in real-time

Ensure proper widget state management with setState()

⭐ Star this repo if you find it helpful!
