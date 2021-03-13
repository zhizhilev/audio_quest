import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';


import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBody();
  }
}

class AppBody extends StatefulWidget {
  @override
  _AppBodyState createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  bool _hasSpeech = false;
  double level = 0.0;
  double minSoundLevel = 50000;
  double maxSoundLevel = -50000;
  String lastWords = '';
  String lastError = '';
  String lastStatus = '';
  String _currentLocaleId = '';
  int resultListened = 0;
  List<LocaleName> _localeNames = [];
  final SpeechToText speech = SpeechToText();

  AudioPlayer _player = null;

  AudioSampleItem currentItem = null;

  AudioSampleItem _sampleTree =
    AudioSampleItem(
        "https://audio.cursor72.ru/media/test/one.mp3",
        AudioSampleItem(
          "https://audio.cursor72.ru/media/test/one_yes.mp3",
          AudioSampleItem(
            "https://audio.cursor72.ru/media/test/two_yes.mp3",
            null,
            null,
            null
          ),
          AudioSampleItem(
              "https://audio.cursor72.ru/media/test/two_no.mp3",
              null,
              null,
              null
          ),
          AudioSampleItem(
              "https://audio.cursor72.ru/media/test/two_no.mp3",
              null,
              null,
              null
          ),
        ),
        AudioSampleItem(
          "https://audio.cursor72.ru/media/test/one_no.mp3",
          null,
          null,
          null
        ),
        AudioSampleItem(
          "https://audio.cursor72.ru/media/test/one_stop.mp3",
          null,
          null,
          null
        )
    );



  Future<void> initSpeechState() async {
    print("234324234");
    var hasSpeech = await speech.initialize(
        onError: errorListener, onStatus: statusListener, debugLogging: true);
    if (hasSpeech) {
      _localeNames = await speech.locales();

      var systemLocale = await speech.systemLocale();
      _currentLocaleId = systemLocale.localeId;
    }
    print("qweqwerewr3");
    if (!mounted) return;

    setState(() {
      _hasSpeech = hasSpeech;
    });
  }



  @override
  void initState() {
    print("Qweqwe");
    _player = AudioPlayer();

    var duration = _player.setUrl(_sampleTree.url);
    initSpeechState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Аудиоквест'),
        ),
        body: Center(
          child: Column(
            children: [
              // ElevatedButton(
              //     child: Text("Инициализация распознавалки"),
              //     onPressed: () {
              //       //_hasSpeech ? null : initSpeechState;
              //     }),
              // ElevatedButton(
              //     child: Text("Начать распознавание"),
              //     onPressed: () {
              //       if (_hasSpeech && !speech.isListening) {
              //         startListening();
              //       }
              //     }),
              ElevatedButton(
                  child: Text("Воспроизвести звук"),
                  onPressed: () {
                    _player.play();
                    print(_player.positionStream.toString());
                  }),

              ElevatedButton(
                  child: Text("Остановить звук"),
                  onPressed: () {
                    _player.stop();
                    print(_player.positionStream..toString());
                  }),


              Container(
                color: Theme.of(context).selectedRowColor,
                child: Center(
                  child: Text(
                    lastWords,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              StreamBuilder<Duration>(
                stream: _player.durationStream,
                builder: (context, snapshot) {
                  final duration = snapshot.data ?? Duration.zero;
                  return StreamBuilder<PositionData>(
                    stream: Rx.combineLatest2<Duration, Duration, PositionData>(
                        _player.positionStream,
                        _player.bufferedPositionStream,
                            (position, bufferedPosition) =>
                            PositionData(position, bufferedPosition)),
                    builder: (context, snapshot) {
                      final positionData = snapshot.data ??
                          PositionData(Duration.zero, Duration.zero);
                      var position = positionData.position;
                      if (position > duration) {
                        position = duration;
                      }
                      var bufferedPosition = positionData.bufferedPosition;
                      if (bufferedPosition > duration) {
                        bufferedPosition = duration;
                      }
                      if (position.inSeconds > duration.inSeconds - 10) {
                        if (_hasSpeech && !speech.isListening) {
                                  startListening();
                        }
                      }
                      print (duration.inSeconds);
                      print(position.inSeconds);
                      return Text(position.toString());
                      //   duration: duration,
                      //   position: position,
                      //   bufferedPosition: bufferedPosition,
                      //   onChangeEnd: (newPosition) {
                      //     _player.seek(newPosition);
                      //   },
                      // );
                    },
                  );
                },
              ),

            ],
          ),
        ),
      ),
    );
  }



  void startListening() {
    lastWords = '';
    lastError = '';
    speech.listen(
        onResult: resultListener,
        listenFor: Duration(seconds: 5),
        pauseFor: Duration(seconds: 5),
        partialResults: false,
        localeId: _currentLocaleId,
        onSoundLevelChange: soundLevelListener,
        cancelOnError: true,
        listenMode: ListenMode.confirmation);
    setState(() {});
  }

  void resultListener(SpeechRecognitionResult result) {
    ++resultListened;
    print('Result listener $resultListened');
    setState(() {
      lastWords = '${result.recognizedWords} - ${result.finalResult}';
    });
    if (lastWords.toLowerCase().contains('да')) {
      _sampleTree = _sampleTree.positiveAnswer;
    }
    if (lastWords.toLowerCase().contains('нет')) {
      _sampleTree = _sampleTree.negativeAnswer;
    }
    if (_sampleTree != null) {
      _player.setUrl(_sampleTree.url);
      _player.play();
      speech.stop();
    }
  }

  void soundLevelListener(double level) {
    minSoundLevel = min(minSoundLevel, level);
    maxSoundLevel = max(maxSoundLevel, level);
    // print("sound level $level: $minSoundLevel - $maxSoundLevel ");
    setState(() {
      this.level = level;
    });
  }

  void errorListener(SpeechRecognitionError error) {
    // print("Received error status: $error, listening: ${speech.isListening}");
    setState(() {
      lastError = '${error.errorMsg} - ${error.permanent}';
    });
  }

  void statusListener(String status) {
    // print(
    // 'Received listener status: $status, listening: ${speech.isListening}');
    setState(() {
      lastStatus = '$status';
    });
  }
}

class PositionData {
  final Duration position;
  final Duration bufferedPosition;

  PositionData(this.position, this.bufferedPosition);
}


class AudioSampleItem {
  final String url;
  final AudioSampleItem positiveAnswer;
  final AudioSampleItem negativeAnswer;
  final AudioSampleItem noAnswer;
  AudioSampleItem(this.url, this.positiveAnswer, this.negativeAnswer, this.noAnswer);
}
