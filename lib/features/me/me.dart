import 'package:cc_diary/core/bloc/diary/diary_bloc.dart';
import 'package:cc_diary/features/me/diary_detail.dart';
import 'package:cc_diary/features/me/widgets/diary_preview.dart';
import 'package:cc_diary/l10n.dart';
import 'package:cc_diary/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:timelines/timelines.dart';

class MePage extends StatelessWidget {
  const MePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: theme().primaryColor,
        appBar: AppBar(
          title: Text(l10n(context).myDiaryPageTitle),
        ),
        body: SafeArea(
          child: BlocBuilder<DiaryBloc, DiaryState>(
            builder: (context, state) {
              if (state is DiaryLoaded) {
                return Timeline.tileBuilder(
                  theme: TimelineThemeData(
                      color: theme().primaryColorDark,
                      nodePosition: 0.15,
                      indicatorPosition: 0.5),
                  builder: TimelineTileBuilder.fromStyle(
                    indicatorStyle: IndicatorStyle.dot,
                    connectorStyle: ConnectorStyle.solidLine,
                    contentsAlign: ContentsAlign.reverse,
                    contentsBuilder: (context, index) {
                      final String formattedDate =
                          DateFormat.Md().format(state.diaries[index].date);
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(formattedDate),
                      );
                    },
                    oppositeContentsBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  DiaryDetailPage(diary: state.diaries[index]),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 16, bottom: 16.0, left: 14, right: 14),
                          child: DiaryPreview(diary: state.diaries[index]),
                        ),
                      );
                    },
                    itemCount: state.diaries.length,
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }
}
