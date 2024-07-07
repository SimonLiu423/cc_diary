import 'package:cc_diary/core/model/diary_m.dart';
import 'package:cc_diary/core/user_info.dart';
import 'package:flutter/material.dart';

class CommentBlock extends StatelessWidget {
  const CommentBlock({super.key, required this.comment, this.isAI = false});

  final bool isAI;
  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isAI
            ? UserInfo.ai(uploadedAt: comment.date, showTimePassed: true)
            : UserInfo.other(uploadedAt: comment.date, showTimePassed: true),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(comment.content, style: const TextStyle(fontSize: 16))),
      ],
    );
  }
}
