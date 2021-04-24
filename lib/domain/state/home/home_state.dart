import 'package:audio_quest/domain/model/audio_sample.dart';
import 'package:mobx/mobx.dart';
import 'package:meta/meta.dart';
import 'package:audio_quest/domain/repository/audio_quest_repository.dart';
import 'package:audio_quest/domain/model/audio_quest.dart';
import 'package:audio_quest/domain/service/speech_recognizer.dart';
import 'package:audio_quest/domain/service/audio_player.dart';

part 'home_state.g.dart';

class HomeState = HomeStateBase with _$HomeState;

abstract class HomeStateBase with Store {
  HomeStateBase(
      this.audioQuestRepository,
      this.speechRecognizer,
      this.audioPlayer
  );

/* audioPlayer */
  final AudioPlayerLocal audioPlayer;

  @action
  void play()  {
    print(audioSampleCurrent.url.toString());
    if (audioSampleCurrent.url != null) {
      audioPlayer.setUrl(audioSampleCurrent.url);
      audioPlayer.play();
    }
  }

  @action
  void stop()  {
    audioPlayer.stop();
  }

  @action
  void answerPositive()  {
    print("answerPositive " );
    //audioSampleCurrent = audioSampleCurrent.positiveAnswer;
  }
  @action
  void answerNegative()  {
    print("negative ");
    //audioSampleCurrent = audioSampleCurrent.negativeAnswer;
  }
  @action
  void noAnswer()  {
    print("noAnswer ");
    //audioSampleCurrent = audioSampleCurrent.noAnswer;
  }

  @action
  Stream<Duration> getDurationStream()  {
    return audioPlayer.getDurationStream();
  }

  @action
  Stream<Duration> getPositionStream()  {
    return audioPlayer.getPositionStream();
  }

  @action
  Stream<Duration> getBufferedPositionStream()  {
    return audioPlayer.getBufferedPositionStream();
  }


/* /audioPlayer */

/* speechRecognizer */
  final SpeechRecognizer speechRecognizer;

  @observable
  bool isRecognizerReady = false;

  @observable
  bool isRecognizerListening = false;

  @observable
  String recognizerResult = '';

  @observable
  String recognizerError = '';

  @observable
  String recognizerStatus = '';

  @action
  void resultListenerCalback(String value)  {
    recognizerResult = value;
    print("result " + value);

    if (value.toLowerCase().contains('да')) {
      print("result positive");
      answerPositive();
      play();
        //_sampleTree = _sampleTree.positiveAnswer;
    } else if (value.toLowerCase().contains('нет')) {
      print("result negative");
      answerNegative();
      play();
      // _sampleTree = _sampleTree.negativeAnswer;
    } else {
      print("result zatupil");
      noAnswer();
      play();
    }
    isRecognizerListening = false;
  }

  @action
  void errorListenerCallback(String value)  {
    recognizerError = value;
    print("error " + value);
    isRecognizerListening = false;
  }

  @action
  void statusListenerCallback(String value)  {
    recognizerStatus = value;
    print("status " + value);
    isRecognizerListening = false;
  }


  @action
  Future<void> initRecognizer() async {
    if (speechRecognizer.resultListenerCallback == null) {
      speechRecognizer.setResultListenerCallback(resultListenerCalback);
    }
    if (speechRecognizer.errorListenerCallback == null) {
      speechRecognizer.setErrorListenerCallback(errorListenerCallback);
    }
    if (speechRecognizer.statusListenerCallback == null) {
      speechRecognizer.setStatusListenerCallback(statusListenerCallback);
    }
    isRecognizerReady = await speechRecognizer.initSpeechState();
    print(isRecognizerReady.toString());
  }

  @action
  Future<void> startRecognizerListening() {
    isRecognizerListening = true;
    speechRecognizer.startListening();
  }

/* /speechRecognizer */

/* get data audio samples tree */
  @observable
  AudioQuestRepository audioQuestRepository;

  @observable
  AudioQuest audioQuest;

  @observable
  AudioSample audioSampleCurrent;//TODO: string

  @observable
  bool isLoading = false;

  AudioSample getFirstAudioSample() {
    for (var key in audioQuest.audioSampleList.keys) {
      if (audioQuest.audioSampleList[key].main) {
        //
      }

    }
  }

  @action
  Future<void> getAudioQuest({
    @required String api_key
  }) async {
    isLoading = true;
    final data = await audioQuestRepository.getAudioQuest(api_key: '');
    audioQuest = data;
    audioSampleCurrent = data; //
    isLoading = false;
  }
  /* /get data audio samples tree  */
}