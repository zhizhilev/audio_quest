import 'package:audio_quest/data/api/request/get_audio_sample_body.dart';
import 'package:audio_quest/data/mapper/audio_sample_mapper.dart';
import 'package:meta/meta.dart';
import 'package:audio_quest/data/api/service/audio_sample_service.dart';
import 'package:audio_quest/domain/model/audio_sample.dart';

class ApiUtil {
  final AudioSampleService _audioSampleService;

  ApiUtil(this._audioSampleService);

  Future<AudioSample> getAudioSample({
    @required String api_key,
  }) async {
    final body = GetAudioSampleBody(api_key: api_key);
    final result = await _audioSampleService.getAudioSample(body);
    return AudioSampleMapper.fromApi(result);
  }
}