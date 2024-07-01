import 'package:cc_diary/features/information/info.dart';
import 'package:cc_diary/features/me/me.dart';
import 'package:cc_diary/features/new_diary/diary.dart';
import 'package:cc_diary/theme.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'CC Diary',
      home: HomePage(),
      localizationsDelegates: const [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale.fromSubtags(
            languageCode: 'zh',
            scriptCode: 'Hant',
            countryCode: 'TW'), // Chinese
      ],
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  Widget _selectedBody() {
    switch (_selectedIndex) {
      case 0:
        return const InfoPage();
      case 2:
        return const DiaryPage();
      case 3:
        return const MePage();
      // case 1:
      //   return const ProfilePage();
      // case 2:
      //   return const SettingsPage();
      default:
        return const Placeholder();
    }
  }

  @override
  Widget build(BuildContext context) {
    // return const DiaryPage();
    return Scaffold(
        body: _selectedBody(),
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: theme().primaryColor,
          style: TabStyle.react,
          items: const [
            TabItem(icon: Icon(CupertinoIcons.home), title: '資訊'),
            TabItem(icon: Icon(CupertinoIcons.profile_circled), title: '探索'),
            TabItem(icon: Icon(CupertinoIcons.settings), title: '新增'),
            TabItem(icon: Icon(CupertinoIcons.settings), title: '個人'),
            TabItem(icon: Icon(CupertinoIcons.add), title: '數據'),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ));
  }
}
