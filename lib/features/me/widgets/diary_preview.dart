import 'package:cc_diary/core/model/diary_m.dart';
import 'package:cc_diary/core/music_bar.dart';
import 'package:cc_diary/theme.dart';
import 'package:flutter/material.dart';

class DiaryPreview extends StatelessWidget {
  const DiaryPreview({super.key, required this.diary});

  final Diary diary;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MusicBar(musicTitle: diary.musicTitle, musicPath: diary.musicPath),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14.0),
          decoration: BoxDecoration(
            color: theme().primaryColorDark,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(diary.content,
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 16)),
        ),
      ],
    );
  }
}
