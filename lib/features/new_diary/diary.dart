import 'package:cc_diary/core/bloc/diary/diary_bloc.dart';
import 'package:cc_diary/core/loading_dialog.dart';
import 'package:cc_diary/l10n.dart';
import 'package:cc_diary/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'diary_bloc.dart';
import 'diary_event.dart';
import 'diary_state.dart';

class DiaryPage extends StatefulWidget {
  const DiaryPage({super.key});

  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  final TextEditingController userInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n(context).myDiaryPageTitle),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: BlocProvider(
            create: (context) => NewDiaryBloc(),
            child: BlocConsumer<NewDiaryBloc, NewDiaryState>(
              listener: (context, state) {
                if (state is DiarySaving) {
                  showDialog(
                      context: context, builder: (_) => const LoadingDialog());
                }
                // Show AI result after save
                if (state is DiarySaved) {
                  // pop the loading dialog
                  Navigator.pop(context);
                  // add the result to the local bloc
                  context.read<DiaryBloc>().add(AddDiary(state.diary));
                  // show AI result
                  showDialog(
                    context: context,
                    builder: (_) => Dialog(
                      // backgroundColor: const Color.fromARGB(150, 50, 50, 50),
                      backgroundColor: theme().primaryColor,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(children: [
                          Expanded(
                              child: Text(state.diary.content,
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white))),
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(l10n(context).newDiary_close)),
                        ]),
                      ),
                    ),
                  ).then((value) => context.read<TabController>().animateTo(3));
                }
              },
              builder: (context, state) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.green),
                          margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                          child: const Icon(
                            CupertinoIcons.music_note,
                            size: 30,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey),
                            child: const Center(
                              child: Text(
                                "www",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black38),
                      child: TextField(
                        maxLines: null,
                        minLines: null,
                        scrollController: ScrollController(),
                        controller: userInput,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 2),
                          hintText: l10n(context).newDiary_writeAreaHint,
                          border: InputBorder.none,
                          hintStyle: const TextStyle(color: Colors.black26),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () => {},
                                  icon: const Icon(
                                      CupertinoIcons.hand_thumbsdown)),
                              IconButton(
                                  onPressed: () => {},
                                  icon: const Icon(CupertinoIcons.smiley)),
                            ],
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              context
                                  .read<NewDiaryBloc>()
                                  .add(SaveDiary("", userInput.text, 1));
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.red),
                            child: Text(l10n(context).newDiary_save,
                                style: const TextStyle(color: Colors.white))),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
