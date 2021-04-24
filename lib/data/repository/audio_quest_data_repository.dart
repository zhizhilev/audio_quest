import 'package:audio_quest/data/api/api_util.dart';
import 'package:audio_quest/domain/model/audio_quest.dart';
import 'package:audio_quest/domain/repository/audio_quest_repository.dart';

class AudioQuestDataRepository extends AudioQuestRepository {
  final ApiUtil _apiUtil;

  AudioQuestDataRepository(this._apiUtil);

  @override
  Future<AudioQuest> getAudioQuest({String api_key}) {
    return _apiUtil.getAudioQuest(api_key: api_key);
  }
}