import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cc_diary/core/model/diary_m.dart';
import 'package:equatable/equatable.dart';

part 'diary_event.dart';
part 'diary_state.dart';

final randomStrings = [
  "Today is a good dayToday is a good dayToday is a good dayToday is a good dayToday is a good dayToday is a good dayToday is a good dayToday is a good dayToday is a good dayToday is a good dayToday is a good dayToday is a good dayToday is a good dayToday is a good dayToday is a good dayToday is a good dayToday is a good dayToday is a good dayToday is a good dayToday is a good dayToday is a good day",
  "I am a good boy",
  "I am a good girl",
  "I am a good man",
  "I am a good woman",
  "I am a good friend",
  "I am a good teacher",
  "I am a good parent",
  "I am a good student",
  "I am a good doctor",
  "I am a good lawyer",
  "I am a good engineer",
  "I am a good programmer",
  "I am a good artist",
  "I am a good writer",
  "I am a good chef",
  "I am a good musician",
  "I am a good singer",
  "I am a good dancer",
  "I am a good actor",
  "I am a good athlete",
  "I am a good sportsman",
  "I am a good athlete",
  "I am a good sportsman",
];

final randomDates = [
  DateTime.now(),
  DateTime.now().add(const Duration(days: 1)),
  DateTime.now().add(const Duration(days: 2)),
  DateTime.now().add(const Duration(days: 3)),
  DateTime.now().add(const Duration(days: 4)),
  DateTime.now().add(const Duration(days: 5)),
  DateTime.now().add(const Duration(days: 6)),
  DateTime.now().add(const Duration(days: 7)),
  DateTime.now().add(const Duration(days: 8)),
  DateTime.now().add(const Duration(days: 9)),
];

final randomMoods = [
  Mood.normal,
  Mood.happy,
  Mood.sad,
  Mood.normal,
  Mood.happy,
  Mood.sad,
  Mood.normal,
  Mood.happy,
  Mood.sad,
  Mood.normal,
];

class DiaryBloc extends Bloc<DiaryEvent, DiaryState> {
  DiaryBloc() : super(DiaryInitial()) {
    on<GetDiary>(_onGetDiary);
  }

  FutureOr<void> _onGetDiary(GetDiary event, Emitter<DiaryState> emit) {
    final List<Diary> diaries = List.generate(
      10,
      (index) => Diary(
          content: randomStrings[index],
          date: randomDates[index],
          mood: randomMoods[index],
          songId: "123456789",
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
}
