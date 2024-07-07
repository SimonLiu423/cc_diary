import 'package:cc_diary/core/diary_detail.dart';
import 'package:cc_diary/core/model/diary_m.dart';
import 'package:cc_diary/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DiaryDetailPage extends StatelessWidget {
  const DiaryDetailPage({super.key, required this.diary});

  final Diary diary;

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat('yyyy / MM / dd');
    return Scaffold(
      backgroundColor: theme().primaryColor,
      appBar: AppBar(
        title: Text(dateFormat.format(diary.date)),
      ),
      body: SafeArea(
        child: Center(child: DiaryDetails(diary: diary)),
      ),
    );
  }
}
