import 'package:cc_diary/core/model/diary_m.dart';
import 'package:cc_diary/l10n.dart';
import 'package:cc_diary/theme.dart';
import 'package:flutter/material.dart';

class CommentBlock extends StatelessWidget {
  const CommentBlock({super.key, required this.comment});

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(getTimePassed(context, comment.date),
            style: const TextStyle(color: Colors.black54)),
        Container(
            padding: const EdgeInsets.all(14.0),
            decoration: BoxDecoration(
              color: theme().primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(comment.content)),
      ],
    );
  }
}

String getTimePassed(BuildContext context, DateTime date) {
  final now = DateTime.now();
  final passed = now.difference(date);
  if (passed.inDays > 0) {
    return l10n(context).daysAgo(passed.inDays.toString());
  } else if (passed.inHours > 0) {
    return l10n(context).hoursAgo(passed.inHours.toString());
  } else if (passed.inMinutes > 0) {
    return l10n(context).minutesAgo(passed.inMinutes.toString());
  } else {
    return l10n(context).secondsAgo(passed.inSeconds.toString());
  }
}
