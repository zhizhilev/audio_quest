import 'package:audio_quest/domain/model/audio_sample.dart';
import 'package:meta/meta.dart';

abstract class AudioSampleRepository {
  Future<AudioSample> getAudioSampleTree({
    @required String api_key
  });
}