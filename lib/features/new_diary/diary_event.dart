import 'package:equatable/equatable.dart';

sealed class NewDiaryEvent extends Equatable {
  const NewDiaryEvent();

  @override
  List<Object> get props => [];
}

class SaveDiary extends NewDiaryEvent {
  final String songId;
  final String diaryContent;
  final int ccState; // 1 ~ 5
  final String language;

  const SaveDiary(this.language, this.songId, this.diaryContent, this.ccState);

  @override
  List<Object> get props => [];
}
