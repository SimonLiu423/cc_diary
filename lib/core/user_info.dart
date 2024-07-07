import 'package:cc_diary/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum UserType { me, other, ai }

class UserInfo extends StatelessWidget {
  const UserInfo.me(
      {super.key, required this.uploadedAt, this.showTimePassed = false})
      : sizeFactor = 1,
        userType = UserType.me;
  const UserInfo.other(
      {super.key, required this.uploadedAt, this.showTimePassed = false})
      : sizeFactor = 0.85,
        userType = UserType.other;
  const UserInfo.ai(
      {super.key, required this.uploadedAt, this.showTimePassed = false})
      : sizeFactor = 0.85,
        userType = UserType.ai;

  final UserType userType;
  final DateTime uploadedAt;
  final bool showTimePassed;
  final double sizeFactor;

  @override
  Widget build(BuildContext context) {
    String timeText = '';
    String userText = '';
    if (showTimePassed) {
      timeText = getTimePassed(context, uploadedAt);
    } else {
      timeText = DateFormat('yyyy-MM-dd').format(uploadedAt);
    }

    switch (userType) {
      case UserType.me:
        userText = l10n(context).you;
        break;
      case UserType.other:
        userText = l10n(context).anonymous;
        break;
      case UserType.ai:
        userText = 'AI';
        break;
    }

    return Row(
      children: [
        Icon(
          userType == UserType.ai
              ? Icons.computer
              : CupertinoIcons.person_alt_circle_fill,
          size: 50 * sizeFactor,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userText,
              style: TextStyle(fontSize: 20 * sizeFactor),
            ),
            Text(
              timeText,
              style: TextStyle(fontSize: 14 * sizeFactor, color: Colors.grey),
            ),
          ],
        ),
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
