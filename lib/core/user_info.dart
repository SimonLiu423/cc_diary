import 'package:cc_diary/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key, required this.uploadedAt});

  final DateTime uploadedAt;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          CupertinoIcons.person_alt_circle_fill,
          size: 50,
        ),
        const SizedBox(width: 10),
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
      ],
    );
  }
}
