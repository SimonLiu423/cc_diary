import 'package:cc_diary/l10n.dart';
import 'package:flutter/material.dart';

class DiaryPage extends StatelessWidget {
  const DiaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(l10n(context).diaryPageTitle),
        ),
        body: Center());
  }
}
