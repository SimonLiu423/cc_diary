import 'dart:async';

import 'package:cc_diary/core/model/diary_m.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

part 'diary_event.dart';
part 'diary_state.dart';

class DiaryBloc extends Bloc<DiaryEvent, DiaryState> {
  DiaryBloc() : super(DiaryInitial()) {
    on<GetDiary>(_onGetDiary);
    on<AddDiary>(_onAddDiary);
  }

  final List<Diary> diaries = [];

  FutureOr<void> _onGetDiary(GetDiary event, Emitter<DiaryState> emit) {
    final List<Diary> diaries = List.generate(
      10,
      (index) => Diary(
          diaryId: const Uuid().v4(),
          content: randomStrings[index],
          date: randomDates[index],
          mood: randomMoods[index],
          musicTitle: randomMusicTitle[index],
          musicPath: randomMusicPath[index],
          comments: [
            Comment(content: "I am a good boy", date: DateTime.now()),
            Comment(content: "I am a good girl", date: DateTime.now()),
            Comment(content: "I am a good man", date: DateTime.now()),
            Comment(content: "I am a good woman", date: DateTime.now()),
            Comment(content: "I am a good friend", date: DateTime.now()),
          ]),
    );
    emit(DiaryLoaded(diaries));
  }

  FutureOr<void> _onAddDiary(AddDiary event, Emitter<DiaryState> emit) {
    diaries.add(event.diary);
    emit(DiaryLoaded(diaries));
  }
}
