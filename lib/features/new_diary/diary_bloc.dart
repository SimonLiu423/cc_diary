import 'dart:async';
import 'dart:developer';

import 'package:cc_diary/core/api.dart';
import 'package:cc_diary/core/model/diary_m.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import 'diary_event.dart';
import 'diary_state.dart';

class NewDiaryBloc extends Bloc<NewDiaryEvent, NewDiaryState> {
  final Dio _dio = Dio();

  NewDiaryBloc() : super(DiaryInitial()) {
    on<SaveDiary>(_onSaveDiary);
  }

  FutureOr<void> _onSaveDiary(
      SaveDiary event, Emitter<NewDiaryState> emit) async {
    log(event.diaryContent);
    emit(DiarySaving());
    final response = await _dio.post("$apiUrl/feedback",
        data: {
          'diary_description': event.diaryContent,
          'language': event.language
        },
        options: Options(headers: {
          'Content-Type': 'application/json',
        }));

    if (response.statusCode == 200) {
      emit(DiarySaved(
        Diary(
          diaryId: const Uuid().v4(),
          content: response.data['feedback'],
          date: DateTime.now(),
          mood: Mood.normal,
          musicTitle: event.musicTitle,
          musicPath: event.musicPath,
          comments: [],
        ),
      ));
    } else {
      throw Exception('Failed to load response');
    }
  }
}
