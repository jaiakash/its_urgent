import 'package:flutter/material.dart';
import 'screens/contacts.dart';
import 'screens/dialer.dart';
import 'screens/settings/settings.dart';
import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.green,
        ),
        home: const NavigationExample());
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({Key? key}) : super(key: key);

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.contacts),
            label: 'Contacts',
          ),
          NavigationDestination(
            icon: Icon(Icons.dialpad),
            label: 'Dialer',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      body: <Widget>[
        const ContactPage(),
        const DialerPage(),
        const SettingPage(),
      ][currentPageIndex],
    );
  }
}
