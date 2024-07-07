import 'dart:math';

final musicInfo = {
  "ANGOSTURA": "ANGOSTURA.mp3",
  "GABRIEL": "GABRIEL.mp3",
  "GET IT": "GET IT.mp3",
  "HELL/HEAVEN": "HELL_HEAVEN.mp3",
  "LIMBO": "LIMBO.mp3",
  "MILLI": "MILLI.mp3",
  "PÈRE": "PÈRE.mp3",
  "SOMEBODY": "SOMEBODY.mp3",
  "WESTSIDE": "WESTSIDE.mp3"
};

MapEntry<String, String> randomMusicInfo() {
  final keys = musicInfo.keys.toList();
  final randomIndex = Random().nextInt(keys.length);
  return MapEntry(keys[randomIndex], musicInfo[keys[randomIndex]]!);
}
