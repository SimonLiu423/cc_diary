import 'package:cc_diary/core/model/diary_m.dart';
import 'package:equatable/equatable.dart';

sealed class NewDiaryState extends Equatable {
  const NewDiaryState();

  @override
  List<Object> get props => [];
}

final class DiaryInitial extends NewDiaryState {}

final class DiarySaving extends NewDiaryState {}

class DiarySaved extends NewDiaryState {
  const DiarySaved(this.diary);

  final Diary diary;

  @override
  List<Object> get props => [diary];
}
