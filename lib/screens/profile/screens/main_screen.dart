import 'package:civic_issue/screens/profile/screens/my_profile.dart';
import 'package:civic_issue/screens/profile/screens/stats_screen.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Only Profile and Stats
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            "Profile",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(Icons.settings, color: Colors.black),
            ),
          ],
          bottom: const TabBar(
            indicatorColor: Colors.blue,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(child: Text("Profile",style: TextStyle(fontSize: 17))),
              Tab(child: Text("Stats",style: TextStyle(fontSize: 17))),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ProfileScreen(),
            StatsScreen()
           ],
        ),
      ),
    );
  }
}
