import 'package:cc_diary/core/model/diary_m.dart';
import 'package:cc_diary/core/music_bar.dart';
import 'package:cc_diary/core/user_info.dart';
import 'package:cc_diary/features/me/widgets/comment_block.dart';
import 'package:cc_diary/l10n.dart';
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
            DiaryDetailHeader(uploadedAt: diary.date, musicTitle: diary.songId),
            const SizedBox(height: 16),
            DiaryDetailBody(diary: diary),
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
  const DiaryDetailHeader(
      {super.key, required this.uploadedAt, required this.musicTitle});

  final String musicTitle;
  final DateTime uploadedAt;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      UserInfo.me(uploadedAt: uploadedAt),
      const Expanded(child: SizedBox()),
      Container(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 3),
          child: MusicBar(musicTitle: musicTitle)),
    ]);
  }
}

class DiaryDetailBody extends StatefulWidget {
  const DiaryDetailBody({super.key, required this.diary});

  final Diary diary;

  @override
  State<DiaryDetailBody> createState() => _DiaryDetailBodyState();
}

class _DiaryDetailBodyState extends State<DiaryDetailBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.5,
      ),
      padding: const EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        color: theme().primaryColorDark,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Scrollbar(
        child: SingleChildScrollView(
            child: Text(widget.diary.content,
                style: const TextStyle(fontSize: 16))),
      ),
    );
  }
}

class CommentInput extends StatelessWidget {
  const CommentInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(hintText: l10n(context).comment),
        onTapOutside: (_) => FocusScope.of(context).unfocus());
  }
}
