import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_harmeless/home.dart';
import 'package:social_harmeless/profilo.dart';
import 'package:social_harmeless/wrapper.dart';
import 'package:social_harmeless/user.dart';
import 'Autenticazione.dart';
import 'Aggiungi.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Social Harmless';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: _title,
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          primaryColor: Colors.blue[300],
        ),
        darkTheme: ThemeData(
          primaryColor: Colors.blue[300],
          brightness: Brightness.dark,
        ),
        initialRoute: "/",
        routes:
        {
          "/":(context)=> StreamProvider<MyUser>.value(
              value: Autenticazione().user,
              child: Wrapper()),
        }
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Post(),
    Aggiungi_Amici(),
    Profilo(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: "Post",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profilo',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[300],
        onTap: _onItemTapped,
      ),
    );
  }
}
