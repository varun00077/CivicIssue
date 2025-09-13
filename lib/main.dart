import 'package:civic_issue/screens/profile/stats_provider.dart';
import 'package:civic_issue/screens/report%20issue/report_issue.dart';
import 'package:civic_issue/widgets/custom_nav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StatsProvider()),
      ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Civic Issue',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: CustomBottomNav()
    ),
    );
  }
}

