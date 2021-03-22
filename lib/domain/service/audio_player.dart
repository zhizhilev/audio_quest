import 'package:just_audio/just_audio.dart';

class AudioPlayerLocal {
  AudioPlayer _player = AudioPlayer();

  void play() {
    _player.play();
  }
  void stop() {
    _player.stop();
  }

  Future<Duration>  setUrl(String url) {
    return  _player.setUrl(url);
  }

  Stream<Duration> getDurationStream() {
    return _player.durationStream;
  }

  Stream<Duration> getPositionStream() {
    return _player.positionStream;
  }
  Stream<Duration> getBufferedPositionStream() {
    return _player.bufferedPositionStream;
  }


}