import 'package:flutter/material.dart';
import 'package:z_media/widgets/FooterSection.dart';
import 'package:z_media/widgets/TextSection.dart';
import 'package:z_media/widgets/VideoSection.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; 

  final List<Widget> _pages = [
    VideoSection(),
    TextDisplayPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Zenesis"),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: FooterSection(
        onItemTapped: _onItemTapped,
        selectedIndex: _selectedIndex,
      ), 
    );
  }
}

