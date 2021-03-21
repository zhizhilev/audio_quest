import 'package:audio_quest/domain/service/speech_recognizer.dart';

class ServiceModule {
  static SpeechRecognizer _speechRecognizer;

  static SpeechRecognizer speechRecognizerService() {
    if (_speechRecognizer == null) {
      _speechRecognizer = SpeechRecognizer();
    }
    return _speechRecognizer;
  }
}