import 'package:equatable/equatable.dart';

sealed class DiaryState extends Equatable {
  const DiaryState();

  @override
  List<Object> get props => [];
}

final class DiaryInitial extends DiaryState {}

class DiaryLoaded extends DiaryState {
  final String songId;
  final String diaryContent;
  final int ccState; // 1 ~ 5

  const DiaryLoaded(this.songId, this.diaryContent, this.ccState);

  @override
  List<Object> get props => [songId, diaryContent];
}
