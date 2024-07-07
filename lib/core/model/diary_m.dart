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
      required this.songId,
      required this.comments});

  final String diaryId;
  final String content;
  final DateTime date;
  final Mood mood;
  final String songId;
  final List<Comment> comments;

  @override
  List<Object?> get props => [diaryId, content, date, mood, songId, comments];

  factory Diary.fromJson(Map<String, dynamic> json) => Diary(
        diaryId: const Uuid().v4(),
        content: json['diary'],
        date: DateTime.parse(json['date']),
        mood: randomMoods[0],
        songId: '',
        comments:
            List<Comment>.from(json['message'].map((x) => Comment.fromJson(x))),
      );
}

List<Diary> randomDiaries({length = 10}) {
  return List.generate(
    length,
    (index) => Diary(
        diaryId: const Uuid().v4(),
        content: randomStrings[index],
        date: randomDates[index],
        mood: randomMoods[index],
        songId: "123456789",
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
  "The query string you provided, username[]=admin&password=aaa, is an example of how data might be sent to a server as part of an HTTP GET or POST request, typically through a URL or form submission. Here’s how this data would be interpreted, especially focusing on the usage of username[] in the context of URL encoding and how Express.js handles it with express.urlencoded({ extended: false }	username[]=admin: This suggests that the username is intended to be an array with a single value, “admin”. In URL-encoded form data, appending [] to the parameter name indicates that this parameter should be treated as an array. This can be used when you expect multiple values for the same parameter, and want to ensure they are correctly parsed as an array even if only one value is sent.password=aaa: This is a straightforward key-value pair, where “password” is the key and “aaa” is the value.How Express.js Handles This:When using express.urlencoded({ extended: false }):Array Parsing: The setting extended: false uses the querystring library to parse incoming request bodies. This library automatically handles the conversion of username[] into an array, so if the form were submitted with multiple username[] entries, they would all be gathered into an array under the username key in the req.body object. Even with extended: false, the [] notation causes the values to be parsed as an array, which is standard behavior across many web frameworks.Data Access: In your Express application, you can access these values from the req.body object like so:",
  ";asldfja;slfjhsa;ildfja;slidfjo;wieur9023io;rwjfshlb09i8uytrewsdfghjuikjhgfdszxcvbnm,lkjhgfdsaqwertyuiop0987654321qwertyuiolkjhgfdsazxcvbnm,lkjhgfdsaqwertyuiop0987654321qwertyuiolkjhgfdsazxcvbnm,lkjhgfdsdrtyuiopoi76543wertyuiolkfdsxcvbn",
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
