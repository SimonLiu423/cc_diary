part of 'diary_bloc.dart';

sealed class DiaryEvent extends Equatable {
  const DiaryEvent();

  @override
  List<Object> get props => [];
}

class GetDiary extends DiaryEvent {
  @override
  List<Object> get props => [];
}
