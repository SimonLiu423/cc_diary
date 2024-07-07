import 'package:cc_diary/core/musicInfo.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

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

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        content: json['description'],
        date: DateTime.parse(json['time']),
      );
}

class Diary extends Equatable {
  const Diary(
      {required this.diaryId,
      required this.content,
      required this.date,
      required this.mood,
      required this.musicTitle,
      required this.musicPath,
      required this.comments});

  final String diaryId;
  final String content;
  final DateTime date;
  final Mood mood;
  final String musicTitle;
  final String musicPath;

  final List<Comment> comments;

  @override
  List<Object?> get props =>
      [diaryId, content, date, mood, musicTitle, comments];

  factory Diary.fromJson(Map<String, dynamic> json) {
    MapEntry<String, String> musicInfo = randomMusicInfo();
    return Diary(
      diaryId: const Uuid().v4(),
      content: json['diary'],
      date: DateTime.parse(json['date']),
      mood: randomMoods[0],
      musicTitle: musicInfo.key,
      musicPath: musicInfo.value,
      comments:
          List<Comment>.from(json['message'].map((x) => Comment.fromJson(x))),
    );
  }
}

List<Diary> randomDiaries({length = 10}) {
  return List.generate(
    length,
    (index) => Diary(
        diaryId: const Uuid().v4(),
        content: randomStrings[index],
        date: randomDates[index],
        mood: randomMoods[index],
        musicTitle: randomMusicTitle[index],
        musicPath: randomMusicPath[index],
        comments: [
          Comment(content: "I am a good boy", date: DateTime.now()),
          Comment(content: "I am a good girl", date: DateTime.now()),
          Comment(content: "I am a good man", date: DateTime.now()),
          Comment(content: "I am a good woman", date: DateTime.now()),
          Comment(content: "I am a good friend", date: DateTime.now()),
        ]),
  );
}

final randomStrings = [
  "今天又是拖延的一天。每次當我面對需要完成的任務時，總是覺得有一種無形的壓力，讓我不由自主地想逃避。我知道自己應該要寫那份報告，或是準備即將到來的考試，但每當我坐下來，心裡就開始找藉口，告訴自己「休息一下也沒關係」或是「晚點再做也來得及」。\n午後，我打開了電腦，原本打算開始工作，但不知不覺中我就打開了社交媒體，瀏覽起了朋友的動態和一些有趣的影片。當我回過神來，時間已經過去了兩個小時。這種情況並不少見，每當我意識到這一點時，內心總是充滿了罪惡感和自責。",
  "I am a good boy",
  "I am a good girl",
  "I am a good man",
  "I am a good woman",
  "I am a good friend",
  "I am a good teacher",
  "I am a good parent",
  "I am a good student",
  "I am a good doctor",
  "I am a good lawyer",
  "I am a good engineer",
  "I am a good programmer",
  "I am a good artist",
  "I am a good writer",
  "I am a good chef",
  "I am a good musician",
  "I am a good singer",
  "I am a good dancer",
  "I am a good actor",
  "I am a good athlete",
  "I am a good sportsman",
  "I am a good athlete",
  "I am a good sportsman",
];

final _musicTitleCache = musicInfo.keys.toList();
final randomMusicTitle = [
  _musicTitleCache[0],
  _musicTitleCache[1],
  _musicTitleCache[2],
  _musicTitleCache[3],
  _musicTitleCache[4],
  _musicTitleCache[5],
  _musicTitleCache[6],
  _musicTitleCache[7],
  _musicTitleCache[8],
  _musicTitleCache[0],
];
final randomMusicPath = randomMusicTitle.map((i) => musicInfo[i]!).toList();

final randomDates = [
  DateTime.now(),
  DateTime.now().add(const Duration(days: 1)),
  DateTime.now().add(const Duration(days: 2)),
  DateTime.now().add(const Duration(days: 3)),
  DateTime.now().add(const Duration(days: 4)),
  DateTime.now().add(const Duration(days: 5)),
  DateTime.now().add(const Duration(days: 6)),
  DateTime.now().add(const Duration(days: 7)),
  DateTime.now().add(const Duration(days: 8)),
  DateTime.now().add(const Duration(days: 9)),
];

final randomMoods = [
  Mood.normal,
  Mood.happy,
  Mood.sad,
  Mood.normal,
  Mood.happy,
  Mood.sad,
  Mood.normal,
  Mood.happy,
  Mood.sad,
  Mood.normal,
];
