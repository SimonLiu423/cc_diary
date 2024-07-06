import 'dart:async';
import 'dart:developer';

import 'package:cc_diary/core/model/diary_m.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import 'diary_event.dart';
import 'diary_state.dart';

class NewDiaryBloc extends Bloc<NewDiaryEvent, NewDiaryState> {
  NewDiaryBloc() : super(DiaryInitial()) {
    on<SaveDiary>(_onSaveDiary);
  }

  FutureOr<void> _onSaveDiary(
      SaveDiary event, Emitter<NewDiaryState> emit) async {
    log(event.diaryContent);
    emit(DiarySaving());
    await Future.delayed(const Duration(seconds: 1));
    emit(DiarySaved(
      Diary(
        diaryId: const Uuid().v4(),
        content: event.diaryContent,
        date: DateTime.now(),
        mood: Mood.normal,
        songId: event.songId,
        comments: [],
      ),
    ));
  }
}
