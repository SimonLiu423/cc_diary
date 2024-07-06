import 'package:equatable/equatable.dart';

sealed class DiaryState extends Equatable {
  const DiaryState();

  @override
  List<Object> get props => [];
}

final class DiaryInitial extends DiaryState {}

final class DiarySaving extends DiaryState {}

class DiarySaved extends DiaryState {
  final String songId;
  final String diaryResult;

  const DiarySaved(this.songId, this.diaryResult);

  @override
  List<Object> get props => [songId, diaryResult];
}
