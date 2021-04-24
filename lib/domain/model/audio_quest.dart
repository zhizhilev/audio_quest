
import 'package:audio_quest/domain/model/audio_sample.dart';

class AudioQuest {
  final int version;
  Map <String, AudioSample> audioSampleList;
  AudioQuest({this.version, this.audioSampleList});
}