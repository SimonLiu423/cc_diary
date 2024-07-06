import 'package:cc_diary/core/model/diary_m.dart';
import 'package:cc_diary/core/music_bar.dart';
import 'package:cc_diary/l10n.dart';
import 'package:cc_diary/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DiaryDetails extends StatelessWidget {
  const DiaryDetails({super.key, required this.diary});

  final Diary diary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 12),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          DiaryDetailHeader(uploadedAt: diary.date),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.52,
            ),
            padding: const EdgeInsets.all(14.0),
            decoration: BoxDecoration(
              color: theme().primaryColorDark,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SingleChildScrollView(
                child:
                    Text(diary.content, style: const TextStyle(fontSize: 16))),
          ),
        ]),
      ),
    );
  }
}

class DiaryDetailHeader extends StatelessWidget {
  const DiaryDetailHeader({super.key, required this.uploadedAt});

  final DateTime uploadedAt;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(CupertinoIcons.person_circle_fill, size: 50),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            // padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
            decoration: BoxDecoration(
              // color: theme().primaryColorDark,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n(context).anonymous,
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    DateFormat('yyyy-MM-dd').format(uploadedAt),
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
              const Expanded(child: SizedBox()),
              Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width / 3),
                  child: const MusicBar()),
            ]),
          ),
        )
      ],
    );
  }
}
