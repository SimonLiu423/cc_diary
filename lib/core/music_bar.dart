import 'dart:developer';
import 'dart:io';

import 'package:audio_session/audio_session.dart';
import 'package:cc_diary/core/seek_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

class MusicBar extends StatefulWidget {
  const MusicBar(
      {super.key,
      required this.musicTitle,
      required this.musicPath,
      this.onTitleClick,
      this.autoplay = false,
      this.titleStyle});

  final String musicTitle;
  final String musicPath;
  final VoidCallback? onTitleClick;
  final TextStyle? titleStyle;
  final bool autoplay;

  @override
  State<MusicBar> createState() => _MusicBarState();
}

class _MusicBarState extends State<MusicBar> with WidgetsBindingObserver {
  final _player = AudioPlayer();
  late File _temporaryAudioFile;

  String musicTitle = "Loading...";

  @override
  void initState() {
    super.initState();
    ambiguate(WidgetsBinding.instance)!.addObserver(this);
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: Colors.black,
    // ));
    _init();
  }

  Future<void> _init() async {
    // Inform the operating system of our app's audio attributes etc.
    // We pick a reasonable default for an app that plays speech.
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.music());
    // Listen to errors during playback.
    _player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      log('A stream error occurred: $e');
    });
    _temporaryAudioFile =
        File('${(await getTemporaryDirectory()).path}/${widget.musicPath}');

    // Try to load audio from a source and catch any errors.
    log("loading ${widget.musicPath}");
    try {
      ByteData data = await rootBundle.load('audio/${widget.musicPath}');
      await _temporaryAudioFile.writeAsBytes(data.buffer.asUint8List());
      await _player.setAudioSource(AudioSource.file(_temporaryAudioFile.path));
    } on PlayerException catch (e) {
      log("Error loading audio source: $e");
    }
    setState(() => musicTitle = widget.musicTitle);
    if(widget.autoplay) {
      _player.play();
    }
  }

  @override
  void dispose() {
    ambiguate(WidgetsBinding.instance)!.removeObserver(this);
    if (_temporaryAudioFile.existsSync()) _temporaryAudioFile.delete();
    _player.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // Release the player's resources when not in use. We use "stop" so that
      // if the app resumes later, it will still remember what position to
      // resume from.
      _player.stop();
    }
  }

  /// Collects the data useful for displaying in a seek bar, using a handy
  /// feature of rx_dart to combine the 3 streams of interest into one.
  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          _player.positionStream,
          _player.bufferedPositionStream,
          _player.durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));

  void togglePlay() {
    if (_player.playing) {
      _player.pause();
    } else {
      _player.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => togglePlay(),
          child: StreamBuilder<PlayerState>(
            stream: _player.playerStateStream,
            builder: (context, snapshot) {
              final playing = snapshot.data?.playing;
              if (playing == true) {
                return const Icon(Icons.pause, color: Colors.black);
              } else {
                return const Icon(Icons.play_arrow, color: Colors.black);
              }
            },
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
            child: GestureDetector(
                onTap: () => (widget.onTitleClick ?? togglePlay).call(),
                child: Text(musicTitle, style: widget.titleStyle))),
      ],
    );
  }
}
