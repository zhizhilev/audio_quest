import 'package:mobx/mobx.dart';
import 'package:meta/meta.dart';
import 'package:audio_quest/domain/repository/audio_sample_repository.dart';
import 'package:audio_quest/domain/model/audio_sample.dart';
import 'package:audio_quest/domain/service/speech_recognizer.dart';

part 'home_state.g.dart';

class HomeState = HomeStateBase with _$HomeState;

abstract class HomeStateBase with Store {
  HomeStateBase(
      this.audioSampleRepository,
      this.speechRecognizer
  );


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
  }

  @action
  void errorListenerCallback(String value)  {
    recognizerError = value;
    print("error " + value);
  }

  @action
  void statusListenerCallback(String value)  {
    recognizerStatus = value;
    print("status " + value);
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
  AudioSampleRepository audioSampleRepository;

  @observable
  AudioSample audioSample;

  @observable
  bool isLoading = false;

  @action
  Future<void> getAudioSample({
    @required String api_key
  }) async {
    isLoading = true;
    final data = await audioSampleRepository.getAudioSampleTree(api_key: '');
    audioSample = data;
    isLoading = false;
  }
  /* /get data audio samples tree  */
}