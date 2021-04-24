import 'package:audio_quest/domain/model/audio_quest.dart';
import 'package:meta/meta.dart';

abstract class AudioQuestRepository {
  Future<AudioQuest> getAudioQuest({
    @required String api_key
  });
}