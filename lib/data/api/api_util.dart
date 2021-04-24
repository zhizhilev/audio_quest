import 'package:audio_quest/data/api/request/get_audio_sample_body.dart';
import 'package:audio_quest/data/mapper/audio_quest_mapper.dart';
import 'package:meta/meta.dart';
import 'package:audio_quest/data/api/service/audio_sample_service.dart';
import 'package:audio_quest/domain/model/audio_quest.dart';

class ApiUtil {
  final AudioSampleService _audioSampleService;

  ApiUtil(this._audioSampleService);

  Future<AudioQuest> getAudioQuest({
    @required String api_key,
  }) async {
    final body = GetAudioQuestBody(api_key: api_key);
    final result = await _audioSampleService.getAudioQuest(body);
    return AudioQuestMapper.fromApi(result);
  }
}