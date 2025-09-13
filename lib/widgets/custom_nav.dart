
import 'package:civic_issue/core/constants.dart';
import 'package:civic_issue/screens/home/home.dart';
import 'package:civic_issue/screens/my%20reports/my_reports.dart';
import 'package:civic_issue/screens/profile/screens/main_screen.dart';
import 'package:civic_issue/screens/profile/screens/my_profile.dart';
import 'package:flutter/material.dart';


class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({super.key});

  @override
  _CustomBottomNavState createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
   ReportIssueScreen(), MyReportScreen(),MainPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],

      bottomNavigationBar: BottomAppBar(
        height: 61,
        color:const Color.fromARGB(255, 255, 255, 255),
        shape: CircularNotchedRectangle(), // notch for FAB
        notchMargin:4.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home,size: 35,),
              color:_selectedIndex==0?buttonColor:secondaryColor,
              onPressed: () => _onItemTapped(0),
            ),
            IconButton(
              icon: Icon(Icons.map,size: 35),
              color:_selectedIndex==1?buttonColor:secondaryColor,
              onPressed: () => _onItemTapped(1),
            ),
            IconButton(
              icon: Icon(Icons.person,size: 35,),
              color:_selectedIndex==2?buttonColor:secondaryColor,
              onPressed: () => _onItemTapped(2),
            ),
            
          ],
        ),
      ),
    );
  }
}
