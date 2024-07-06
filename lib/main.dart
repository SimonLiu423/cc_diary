import 'package:cc_diary/core/bloc/diary/diary_bloc.dart';
import 'package:cc_diary/features/information/info.dart';
import 'package:cc_diary/features/me/me.dart';
import 'package:cc_diary/features/new_diary/diary.dart';
import 'package:cc_diary/features/stat/stat.dart';
import 'package:cc_diary/l10n.dart';
import 'package:cc_diary/theme.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CC Diary',
      home: const HomePage(),
      theme: theme(),
      localizationsDelegates: const [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
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

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  Widget _selectedBody(int index) {
    switch (index) {
      case 0:
        return const InfoPage();
      case 2:
        return const DiaryPage();
      case 3:
        return const MePage();
      case 4:
        return const StatPage();
      default:
        return const Placeholder();
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DiaryBloc()..add(GetDiary()),
      child: ChangeNotifierProvider(
        create: (context) => _tabController,
        child: Scaffold(
            body: _selectedBody(_tabController.index),
            bottomNavigationBar: ConvexAppBar(
              controller: _tabController,
              backgroundColor: theme().appBarTheme.backgroundColor,
              style: TabStyle.react,
              items: [
                TabItem(
                    icon: const Icon(Icons.health_and_safety),
                    title: l10n(context).infoPageTitle),
                TabItem(
                    icon: const Icon(Icons.people),
                    title: l10n(context).explorePageTitle),
                TabItem(
                    icon: const Icon(Icons.add),
                    title: l10n(context).addPageTitle),
                TabItem(
                    icon: const Icon(Icons.menu_book_rounded),
                    title: l10n(context).myDiaryPageTitle),
                TabItem(
                    icon: const Icon(Icons.bar_chart_rounded),
                    title: l10n(context).statPageTitle),
              ],
            )),
      ),
    );
  }
}
