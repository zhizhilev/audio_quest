import 'package:audio_quest/data/api/model/api_audio_sample.dart';

class ApiQuest {
  String version;
  Map <String, ApiAudioSample> audioSampleList;


  ApiQuest(Map<String, dynamic> map):
        version = map['version'];
  //       audioSampleList =
  //       url = map['url'],
  //       positiveAnswer = ApiAudioSample.fromApi(map['positiveAnswer']),
  //       negativeAnswer = ApiAudioSample.fromApi(map['negativeAnswer']),
  //       noAnswer = ApiAudioSample.fromApi(map['noAnswer']),
  //       secToEnd = map['secToEnd'] ?? 0;
  //
  //
  factory ApiQuest.fromApi(Map<String, dynamic> map) {
    if(map == null){
      return null;
    }
    else {
      return ApiQuest(map);
    }
  }
}