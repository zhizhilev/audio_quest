import 'package:audio_quest/data/api/model/api_audio_sample.dart';
import 'package:audio_quest/data/api/model/api_quest.dart';
import 'package:audio_quest/domain/model/audio_quest.dart';
import 'package:audio_quest/domain/model/audio_sample.dart';

class AudioQuestMapper {

  static Map <String, AudioSample> sampleListMapper(Map <String, ApiAudioSample> apiList)  {
    Map <String, AudioSample> result = Map();
    for (var key in apiList.keys) {
      result[key] = apiList[key].toAudioSample();
    }
    return result;
  }

  static AudioQuest fromApi(ApiQuest quest) {
    if (quest == null) {
      return null;
    }

    return AudioQuest(
        version: quest.version,
        audioSampleList: sampleListMapper(quest.audioSampleList)
    );
  }
}