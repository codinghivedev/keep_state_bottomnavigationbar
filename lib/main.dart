import 'package:flutter/material.dart';
import 'package:keep_state_bottomnavigationbar/first_page.dart';
import 'package:keep_state_bottomnavigationbar/second_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _selectedPage = 0;
  List<Widget> pageList = List<Widget>();

  @override
  void initState() {
    pageList.add(FirstPage());
    pageList.add(SecondPage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: IndexedStack(
        index: _selectedPage,
        children: pageList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.phone_android),
            title: Text('First Page'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone_android),
            title: Text('Second Page'),
          ),
        ],
        currentIndex: _selectedPage,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }
}
