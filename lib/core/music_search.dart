import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MusicSearch extends StatefulWidget {
  const MusicSearch({super.key});

  @override
  State<MusicSearch> createState() => _MusicSearchState();
}

class _MusicSearchState extends State<MusicSearch> {
  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      isFullScreen: false,
      builder: (BuildContext context, SearchController controller) {
        return SearchBar(

          controller: controller,
          padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 16)),
          onTap: () {
            controller.openView();
          },
          onChanged: (e) {
            controller.openView();
          },
          leading: const Icon(Icons.music_note),
        );
      },
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        var list = List<ListTile>.generate(
          5,
              (int index) {
            final String item = 'item $index';
            return ListTile(
              title: MusicSearchItem(musicName: item),
              onTap: () {
                setState(() {
                  controller.closeView(item);
                });
              },
            );
          },
        );
        return list;
      },
    );
  }
}

class MusicSearchItem extends StatelessWidget {
  final String musicName;
  const MusicSearchItem({super.key, required this.musicName});

  @override
  Widget build(BuildContext context) {
    return Text(musicName);
  }
}

