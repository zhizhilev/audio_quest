import 'package:audio_quest/domain/service/speech_recognizer.dart';
import 'package:audio_quest/domain/service/audio_player.dart';

class ServiceModule {
  static SpeechRecognizer _speechRecognizer;
  static AudioPlayerLocal _audioPlayer;

  static SpeechRecognizer speechRecognizerService() {
    if (_speechRecognizer == null) {
      _speechRecognizer = SpeechRecognizer();
    }
    return _speechRecognizer;
  }

  static AudioPlayerLocal audioPlayerService() {
    if (_audioPlayer == null) {
      _audioPlayer = AudioPlayerLocal();
    }
    return _audioPlayer;
  }
}