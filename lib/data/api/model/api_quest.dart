import 'package:audio_quest/data/api/model/api_audio_sample.dart';

class ApiQuest {
  int version;
  Map <String, ApiAudioSample> audioSampleList;


  ApiQuest(Map<String, dynamic> map) {
    version = map['version'];
    audioSampleList = Map();
    for (var sample in map['data']) {
      ApiAudioSample sampleItem = ApiAudioSample.fromApi(sample);
      audioSampleList[sampleItem.uid] = sampleItem;
    }
  }

  factory ApiQuest.fromApi(Map<String, dynamic> map) {
    if(map == null){
      return null;
    }
    else {
      return ApiQuest(map);
    }
  }
}