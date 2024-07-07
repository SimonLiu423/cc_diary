import 'dart:async';
import 'dart:developer';

import 'package:cc_diary/core/api.dart';
import 'package:cc_diary/core/model/diary_m.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'diary_event.dart';
part 'diary_state.dart';

class DiaryBloc extends Bloc<DiaryEvent, DiaryState> {
  DiaryBloc() : super(DiaryInitial()) {
    on<GetDiary>(_onGetDiary);
    on<AddDiary>(_onAddDiary);
  }

  final Dio _dio = Dio();

  late List<Diary> diaries = [];

  FutureOr<void> _onGetDiary(GetDiary event, Emitter<DiaryState> emit) async {
    final response = await _dio.get("$apiUrl/record");
    if (response.statusCode == 200) {
      final fetchedDiaries = List<Diary>.from(
          response.data['content'].map((x) => Diary.fromJson(x)));
      diaries.addAll(fetchedDiaries);
    }

    // sort by date
    diaries.sort((a, b) => b.date.compareTo(a.date));

    emit(DiaryLoaded(diaries));
  }

  FutureOr<void> _onAddDiary(AddDiary event, Emitter<DiaryState> emit) {
    diaries.add(event.diary);
    diaries.sort((a, b) => b.date.compareTo(a.date));
    emit(DiaryLoaded(diaries));
  }
}
