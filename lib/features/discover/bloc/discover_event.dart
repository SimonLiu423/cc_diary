part of 'discover_bloc.dart';

sealed class DiscoverEvent extends Equatable {
  const DiscoverEvent();

  @override
  List<Object> get props => [];
}

class GetDiscover extends DiscoverEvent {}

class SubmitComment extends DiscoverEvent {
  const SubmitComment(this.diaryId, this.comment);

  final String diaryId;
  final String comment;

  @override
  List<Object> get props => [diaryId, comment];
}
