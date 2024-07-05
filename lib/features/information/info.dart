import 'package:cc_diary/features/new_diary/diary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../l10n.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xffedede9),
        appBar: AppBar(
          title: Text(l10n(context).myDiaryPageTitle),
        ),
        body: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: (1 / 1),
          padding: const EdgeInsets.all(16.0),
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          children: List.generate(9, (index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey[850],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Image.asset(
                  'images/depression.png',
                  fit: BoxFit
                      .cover, // This can be changed to fit your design needs
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

}
