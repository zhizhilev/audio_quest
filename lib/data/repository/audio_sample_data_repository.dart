import 'package:audio_quest/data/api/api_util.dart';
import 'package:audio_quest/domain/model/audio_sample.dart';
import 'package:audio_quest/domain/repository/audio_sample_repository.dart';

class AudioSampleDataRepository extends AudioSampleRepository {
  final ApiUtil _apiUtil;

  AudioSampleDataRepository(this._apiUtil);

  @override
  Future<AudioSample> getAudioSampleTree({String api_key}) {
    return _apiUtil.getAudioSample(api_key: api_key);
  }
}