import 'package:flutter/material.dart';
import 'package:z_media/widgets/FooterSection.dart';
import 'package:z_media/widgets/TextSection.dart';
import 'package:z_media/widgets/VideoSection.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  if (index == 2) { 
    return;
  }
  setState(() {
    _selectedIndex = index;
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       extendBodyBehindAppBar: true,
  extendBody: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                color: Colors.grey, 
                width: 1.0, 
              ),
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/logo.png'),
            ),
            title: const Text(
              "Zenesis",
              style: TextStyle(
                color: Color.fromARGB(255, 48, 48, 48),
              ),
            ),
            centerTitle: true,
          ),
        ),
      ),
     body: _pages[_selectedIndex],

      bottomNavigationBar: FooterSection(
        onItemTapped: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
