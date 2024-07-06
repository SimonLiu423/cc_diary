import 'package:cc_diary/core/diary_detail.dart';
import 'package:cc_diary/core/model/diary_m.dart';
import 'package:cc_diary/features/discover/bloc/discover_bloc.dart';
import 'package:cc_diary/l10n.dart';
import 'package:cc_diary/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    final diaries = randomDiaries();
    return Scaffold(
      backgroundColor: theme().primaryColor,
      appBar: AppBar(
        title: Text(l10n(context).discoverPageTitle),
        backgroundColor: theme().appBarTheme.backgroundColor,
      ),
      body: BlocProvider(
        create: (context) => DiscoverBloc()..add(GetDiscover()),
        child: BlocBuilder<DiscoverBloc, DiscoverState>(
          builder: (context, state) {
            return PageView.builder(
              itemCount: diaries.length,
              itemBuilder: (context, index) {
                if (state is DiscoverLoaded) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (index != 0)
                        const Center(child: Icon(Icons.chevron_left))
                      else
                        const SizedBox(width: 25),
                      DiaryDetails(diary: state.diaries[index]),
                      if (index != state.diaries.length - 1)
                        const Center(child: Icon(Icons.chevron_right))
                      else
                        const SizedBox(width: 25),
                    ],
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            );
          },
        ),
      ),
    );
  }
}
