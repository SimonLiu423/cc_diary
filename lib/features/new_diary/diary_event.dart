import 'package:equatable/equatable.dart';

sealed class DiaryEvent extends Equatable {
  const DiaryEvent();

  @override
  List<Object> get props => [];
}

class SaveDiary extends DiaryEvent {
  final String songId;
  final String diaryContent;
  final int ccState; // 1 ~ 5
  
  const SaveDiary(this.songId, this.diaryContent, this.ccState);


  @override
  List<Object> get props => [];
}
