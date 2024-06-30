import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'CC Diary',
      theme: CupertinoThemeData(primaryColor: CupertinoColors.activeBlue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: ConvexAppBar(
      style: TabStyle.react,
      items: const [
        TabItem(icon: Icon(CupertinoIcons.home), title: 'Home'),
        TabItem(icon: Icon(CupertinoIcons.profile_circled), title: 'Profile'),
        TabItem(icon: Icon(CupertinoIcons.settings), title: 'Settings')
      ],
    ));
  }
}
