part of 'diary_bloc.dart';

sealed class DiaryState extends Equatable {
  const DiaryState();

  @override
  List<Object> get props => [];
}

final class DiaryInitial extends DiaryState {}

class DiaryLoaded extends DiaryState {
  final List<Diary> diaries;

  const DiaryLoaded(this.diaries);

  @override
  List<Object> get props => [diaries];
}
