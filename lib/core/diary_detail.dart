import 'package:cc_diary/core/model/diary_m.dart';
import 'package:cc_diary/core/music_bar.dart';
import 'package:cc_diary/core/user_info.dart';
import 'package:cc_diary/features/me/widgets/comment_block.dart';
import 'package:cc_diary/theme.dart';
import 'package:flutter/material.dart';

class DiaryDetails extends StatelessWidget {
  const DiaryDetails({super.key, required this.diary});

  final Diary diary;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 50,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 12),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            DiaryDetailHeader(uploadedAt: diary.date),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.5,
              ),
              padding: const EdgeInsets.all(14.0),
              decoration: BoxDecoration(
                color: theme().primaryColorDark,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SingleChildScrollView(
                  child: Text(diary.content,
                      style: const TextStyle(fontSize: 16))),
            ),
            const CommentInput(),
            ...diary.comments.map((comment) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: CommentBlock(
                    comment: comment,
                  ),
                ))
          ]),
        ),
      ),
    );
  }
}

class DiaryDetailHeader extends StatelessWidget {
  const DiaryDetailHeader({super.key, required this.uploadedAt});

  final DateTime uploadedAt;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      UserInfo.me(uploadedAt: uploadedAt),
      const Expanded(child: SizedBox()),
      Container(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 3),
          child: const MusicBar()),
    ]);
  }
}

class CommentInput extends StatelessWidget {
  const CommentInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(onTapOutside: (_) => FocusScope.of(context).unfocus());
  }
}
