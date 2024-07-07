import 'package:cc_diary/core/music_bar.dart';
import 'package:cc_diary/theme.dart';
import 'package:flutter/material.dart';

import 'musicInfo.dart';

class MusicSearch extends StatefulWidget {
  const MusicSearch({super.key, this.onMusicChange});

  final void Function(String musicTitle, String musicPath)? onMusicChange;

  @override
  State<MusicSearch> createState() => _MusicSearchState();
}

class _MusicSearchState extends State<MusicSearch> {
  static const height = 50.0;
  static const padding = 16.0;
  static const TextStyle titleStyle = TextStyle(fontSize: 20);
  final SearchController controller = SearchController();

  bool searching = true;
  String musicTitle = "";
  String? musicPath;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        height: height,
        child: SearchAnchor(
          viewConstraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.4),
          viewBackgroundColor: theme().primaryColorDark,
          searchController: controller,
          isFullScreen: false,
          builder: (BuildContext context, SearchController controller) {
            return SearchBar(
              backgroundColor: WidgetStatePropertyAll(theme().primaryColorDark),
              elevation: const WidgetStatePropertyAll(3),
              enabled: searching,
              textStyle: const WidgetStatePropertyAll(titleStyle),
              controller: controller,
              padding: const WidgetStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: padding)),
              onTap: controller.openView,
              leading: const Icon(Icons.music_note),
            );
          },
          suggestionsBuilder:
              (BuildContext context, SearchController controller) {
            List<ListTile> list = [];
            for (var value in musicInfo.entries) {
              if (value.key
                  .toUpperCase()
                  .contains(controller.text.toUpperCase())) {
                list.add(
                  ListTile(
                      title: MusicSearchItem(musicName: value.key),
                      onTap: () {
                        controller.closeView(value.key);
                        setState(() {
                          musicTitle = value.key;
                          musicPath = value.value;
                          searching = false;
                        });
                        widget.onMusicChange?.call(musicTitle, musicPath!);
                      }),
                );
              }
            }
            return list;
          },
        ),
      ),
      if (!searching)
        Container(
          height: height,
          padding: const EdgeInsets.symmetric(horizontal: padding),
          decoration: BoxDecoration(
              color: theme().primaryColor,
              borderRadius: BorderRadius.circular(height)),
          child: MusicBar(
              musicTitle: musicTitle,
              musicPath: musicPath!,
              onTitleClick: () {
                setState(() => searching = true);
                controller.openView();
              },
              titleStyle: titleStyle),
        ),
    ]);
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
