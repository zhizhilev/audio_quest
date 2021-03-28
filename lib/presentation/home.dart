import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:audio_quest/domain/state/home/home_state.dart';
import 'package:audio_quest/internal/dependencies/home_module.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeState _homeState;

  void _getAudioSample() async {
    // здесь получаем данные
    await _homeState.getAudioSample(api_key: '');
  }


  @override
  void initState() {
    super.initState();
    _homeState = HomeModule.homeState();
    _getAudioSample();
    _homeState.initRecognizer();
    print("Qweqwe");
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Аудиоквест'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                child: Text("Инициализация распознавалки"),
                onPressed: () {
                  _homeState.initRecognizer();
                }),
            ElevatedButton(
                child: Text("Начать распознавание"),
                onPressed: () {
                  _homeState.startRecognizerListening();
                }),
            ElevatedButton(
                child: Text("Воспроизвести звук"),
                onPressed: () {
                  _homeState.play();
                }),

            ElevatedButton(
                child: Text("Остановить звук"),
                onPressed: () {
                  _homeState.stop();
                }),
            ElevatedButton(
                child: Text("Тест next"),
                onPressed: () {
                  //_getAudioSample();
                  _homeState.stop();
                  _homeState.answerNegative();
                  _homeState.play();
                }),
            ElevatedButton(
                child: Text("Clear"),
                onPressed: () {
                  _getAudioSample();
                }),

            _getRecognizerInfo(),

            StreamBuilder<Duration>( // это запускается всегда
              stream: _homeState.getDurationStream(),
              builder: (context, snapshot) {
                final duration = snapshot.data ?? Duration.zero;
                return StreamBuilder<PositionData>(
                  stream: Rx.combineLatest2<Duration, Duration, PositionData>(
                      _homeState.getPositionStream(),
                      _homeState.getBufferedPositionStream(),
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
                    print ("==" + _homeState.isRecognizerListening.toString());
                    print ("+=" + _homeState?.audioSampleCurrent?.secToEnd.toString());
                    if (!_homeState.isRecognizerListening) {
                      if (
                          position.inSeconds > 0
                          && duration.inSeconds > 0
                          && position.inSeconds >= duration.inSeconds - _homeState.audioSampleCurrent.secToEnd
                      ) {
                        //TODO: начало распознавания
                        print("Начало распознавания текста (нужно запустить)");
                        print(position.inSeconds);
                        print(duration.inSeconds);
                        print("--------");
                        _homeState.stop();
                        _homeState.startRecognizerListening();
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
    );
  }


  Widget _getRecognizerInfo() {
    return Observer(
      builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Theme.of(context).selectedRowColor,
              child: Center(
                child: Text(
                  "Готовность распознавалки " + (_homeState.isRecognizerReady ? "Готово" : "не готово"),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              color: Theme.of(context).selectedRowColor,
              child: Center(
                child: Text(
                  "Статус распознавалки " + _homeState.recognizerStatus,
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            Container(
              color: Theme.of(context).selectedRowColor,
              child: Center(
                child: Text(
                  "Ошибка распознавалки " + _homeState.recognizerError,
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            Container(
              color: Theme.of(context).selectedRowColor,
              child: Center(
                child: Text(
                  "Результат распознавалки " + _homeState.recognizerResult,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

}


class PositionData {
  final Duration position;
  final Duration bufferedPosition;

  PositionData(this.position, this.bufferedPosition);
}


