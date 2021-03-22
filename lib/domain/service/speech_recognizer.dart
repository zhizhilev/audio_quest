import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'dart:math';
import 'package:flutter/services.dart';

class SpeechRecognizer {
  //List<LocaleName> _localeNames = [];
  final SpeechToText speech = SpeechToText();

  // bool _hasSpeech = false;
  double level = 0.0;
  double minSoundLevel = 50000;
  double maxSoundLevel = -50000;
  String lastWords = '';
  String lastError = '';
  String lastStatus = '';
  String _currentLocaleId = '';
  int resultListened = 0;

  Function errorListenerCallback;
  Function statusListenerCallback;
  Function resultListenerCallback;

  void setResultListenerCallback(Function callback) {
    this.resultListenerCallback = callback;
  }

  void setStatusListenerCallback(Function callback) {
    this.statusListenerCallback = callback;
  }
  void setErrorListenerCallback(Function callback) {
    this.errorListenerCallback = callback;
  }

  Future<bool> initSpeechState() async {
    print("qwe initSpeechState");
    var hasSpeech = false;
    try{
      hasSpeech = await speech.initialize(
          onError: errorListener, onStatus: statusListener, debugLogging: true);
    }
    on PlatformException catch(e) {
      String msg = "Нет распознавалки! Произошла ошибка: " + e.message;
      print(msg);
      setErrorMessage(msg);
      return hasSpeech;
    }
    catch(e){
      String msg ="Произошла ошибка: $e";
      print(msg);
      setErrorMessage(msg);
      return hasSpeech;
    }

    if (hasSpeech) {
      //_localeNames = await speech.locales();

      var systemLocale = await speech.systemLocale();
      _currentLocaleId = systemLocale.localeId;
    }
    print("qweqwerewr3 " + hasSpeech.toString());
    return hasSpeech;
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
  }

  void resultListener(SpeechRecognitionResult result) {
    ++resultListened;

    //lastWords = '${result.recognizedWords} - ${result.finalResult}';
    lastWords = result.recognizedWords;
    print('Result listener $resultListened');
    print("Result listener " + lastWords.toLowerCase());
    if (resultListenerCallback != null) {
      resultListenerCallback(lastWords.toLowerCase());
    }
    // setState(() { // TODO: изменение состояния
    //   lastWords = '${result.recognizedWords} - ${result.finalResult}';
    // });

    // if (lastWords.toLowerCase().contains('да')) {
    //   _sampleTree = _sampleTree.positiveAnswer;
    // }
    // if (lastWords.toLowerCase().contains('нет')) {
    //   _sampleTree = _sampleTree.negativeAnswer;
    // }
    // if (_sampleTree != null) {
    //   speech.stop();
    //   _player.setUrl(_sampleTree.url);
    //   _player.play();
    // }
  }

  void soundLevelListener(double level) {
    minSoundLevel = min(minSoundLevel, level);
    maxSoundLevel = max(maxSoundLevel, level);
  }

  void errorListener(SpeechRecognitionError error) {
    // print("Received error status: $error, listening: ${speech.isListening}");
    // lastError = '${error.errorMsg} - ${error.permanent}';
    setErrorMessage('${error.errorMsg} - ${error.permanent}');
  }

  void setErrorMessage(String msg) {
    if (errorListenerCallback != null) {
      errorListenerCallback(msg);
    }
  }

  void statusListener(String status) {
    // 'Received listener status: $status, listening: ${speech.isListening}');
    if (statusListenerCallback != null) {
      statusListenerCallback(status);
    }
  }
}