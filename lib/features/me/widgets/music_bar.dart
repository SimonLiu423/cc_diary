import 'package:flutter/material.dart';

class MusicBar extends StatelessWidget {
  const MusicBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: const SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Icon(Icons.music_note),
            SizedBox(width: 10),
            Text('Music'),
          ],
        ),
      ),
    );
  }
}
