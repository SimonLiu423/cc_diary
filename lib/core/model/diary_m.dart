import 'package:equatable/equatable.dart';

enum Mood {
  happy,
  sad,
  normal,
}

class Comment extends Equatable {
  const Comment({required this.content, required this.date});

  final String content;
  final DateTime date;

  @override
  List<Object?> get props => [content, date];
}

class Diary extends Equatable {
  const Diary(
      {required this.content,
      required this.date,
      required this.mood,
      required this.songId,
      required this.comments});

  final String content;
  final DateTime date;
  final Mood mood;
  final String songId;
  final List<Comment> comments;

  @override
  List<Object?> get props => [content, date, mood, songId, comments];
}
