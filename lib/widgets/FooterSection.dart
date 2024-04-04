import 'package:flutter/material.dart';



class FooterSection extends StatelessWidget {
   final int selectedIndex;
  final Function(int) onItemTapped;


  const FooterSection({Key? key, required this.onItemTapped, required this.selectedIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.video_library),
          label: 'Videos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.text_fields),
          label: 'Text',
        ),
      ],
      currentIndex: selectedIndex, // Highlight the selected tab
      onTap: onItemTapped,
      
    );
  }
}
