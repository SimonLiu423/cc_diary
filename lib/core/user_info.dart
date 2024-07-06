import 'package:cc_diary/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum UserType { me, other }

class UserInfo extends StatelessWidget {
  const UserInfo.me(
      {super.key, required this.uploadedAt, this.showTimePassed = false})
      : sizeFactor = 1,
        userType = UserType.me;
  const UserInfo.other(
      {super.key, required this.uploadedAt, this.showTimePassed = false})
      : sizeFactor = 0.85,
        userType = UserType.other;

  final UserType userType;
  final DateTime uploadedAt;
  final bool showTimePassed;
  final double sizeFactor;

  @override
  Widget build(BuildContext context) {
    String timeText = '';
    if (showTimePassed) {
      timeText = getTimePassed(context, uploadedAt);
    } else {
      timeText = DateFormat('yyyy-MM-dd').format(uploadedAt);
    }

    return Row(
      children: [
        Icon(
          CupertinoIcons.person_alt_circle_fill,
          size: 50 * sizeFactor,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userType == UserType.me
                  ? l10n(context).you
                  : l10n(context).anonymous,
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
