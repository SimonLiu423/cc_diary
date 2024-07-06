part of 'discover_bloc.dart';

sealed class DiscoverState extends Equatable {
  const DiscoverState();

  @override
  List<Object> get props => [];
}

final class DiscoverInitial extends DiscoverState {}

final class DiscoverLoading extends DiscoverState {}

final class DiscoverLoaded extends DiscoverState {
  const DiscoverLoaded(this.diaries);

  final List<Diary> diaries;

  @override
  List<Object> get props => [diaries];
}
