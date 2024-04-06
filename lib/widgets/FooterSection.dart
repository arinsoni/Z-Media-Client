import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const FooterSection({Key? key, required this.onItemTapped, required this.selectedIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color defaultSelectedColor = Colors.black;
    final Color textSectionSelectedColor = Colors.black;

    Color getColorForIndex(int index) {
      if (index == selectedIndex) {
        return index == 1 ? textSectionSelectedColor : defaultSelectedColor;
      }
      return Colors.grey; 
    }

    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.video_library, color: getColorForIndex(0)),
          label: 'Videos',
        ),
        
        BottomNavigationBarItem(
          icon: Icon(Icons.text_fields, color: getColorForIndex(1)),
          label: 'Text',
        ),
      ],
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      selectedItemColor: Colors.transparent, 
      unselectedItemColor: Colors.transparent, 
    );
  }
}
